// ==UserScript==
// @name         dotnet_download_auto-focus
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Instantly finds, highlights, and scrolls to the desired .NET installer (no version required).
// @author       https://github.com/col83
// @match        https://dotnet.microsoft.com/*
// @icon         https://dotnet.microsoft.com/favicon.ico
// @grant        none
// @run-at       document-start
// ==/UserScript==

(function () {
    'use strict';

    const PRODUCT_PART = "runtime-desktop";
    const ARCH_PART = "windows-x64-installer";

    let isExecuted = false;

    function highlightAndScroll() {
        if (isExecuted) return;

        const selector = `a[data-bi-dlid*="${PRODUCT_PART}"][data-bi-dlid*="${ARCH_PART}"]`;
        const link = document.querySelector(selector);

        if (!link) return false;

        const container = link.closest('table') || link.closest('.row, .content, div');

        const setPermanentHighlight = (el, color) => {
            if (!el) return;
            el.style.setProperty('background-color', color, 'important');
            el.style.setProperty('border', '2px solid #fbc02d', 'important');
        };

        setPermanentHighlight(container, '#ffffcc');
        setPermanentHighlight(link, '#ffeb3b');

        attemptScrollIntoView(link);

        isExecuted = true;
        return true;
    }

    function attemptScrollIntoView(element, retries = 0) {
        if (!document.body.contains(element)) {
            isExecuted = false;
            return;
        }

        const rect = element.getBoundingClientRect();

        if ((rect.height === 0 || rect.width === 0) && retries < 20) {
            requestAnimationFrame(() => attemptScrollIntoView(element, retries + 1));
            return;
        }

        const isVisible = rect.top >= 0 && rect.top <= window.innerHeight;

        if (!isVisible && retries < 20) {
            element.scrollIntoView({ behavior: 'instant', block: 'center' });
        }
    }

    const observer = new MutationObserver(() => {
        if (isExecuted) {
            observer.disconnect();
            return;
        }
        if (highlightAndScroll()) {
            setTimeout(() => {
                if(isExecuted) observer.disconnect();
            }, 1000);
        }
    });

    observer.observe(document.documentElement, { childList: true, subtree: true });

    window.addEventListener('load', () => {
        if (!isExecuted) highlightAndScroll();
    }, { once: true });

})();