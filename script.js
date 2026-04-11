// ===== BURGER MENU =====
document.addEventListener('DOMContentLoaded', () => {
    const burger = document.querySelector('.burger');
    const navLinks = document.querySelector('.nav-links');

    if (burger && navLinks) {
        burger.addEventListener('click', () => {
            navLinks.classList.toggle('open');
            burger.classList.toggle('active');
        });

        // Close menu on link click
        navLinks.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                navLinks.classList.remove('open');
                burger.classList.remove('active');
            });
        });
    }

    // ===== USAGE TABS =====
    const tabs = document.querySelectorAll('.usage-tab');
    const contents = document.querySelectorAll('.usage-content');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            const target = tab.getAttribute('data-tab');

            tabs.forEach(t => t.classList.remove('active'));
            contents.forEach(c => c.classList.remove('active'));

            tab.classList.add('active');
            const targetEl = document.getElementById('tab-' + target);
            if (targetEl) targetEl.classList.add('active');
        });
    });

    // ===== SCROLL ANIMATIONS (Intersection Observer) =====
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    document.querySelectorAll('.feature-card, .pipeline-step, .req-card, .download-box').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });

    // ===== HEADER SHADOW ON SCROLL =====
    const header = document.querySelector('.header');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 10) {
            header.style.boxShadow = '0 4px 20px rgba(0,0,0,0.4)';
        } else {
            header.style.boxShadow = 'none';
        }
    });

    // ===== SMOOTH SCROLL for anchor links =====
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', (e) => {
            e.preventDefault();
            const target = document.querySelector(anchor.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

    // ===== TYPING EFFECT for terminal badge =====
    const badge = document.querySelector('.terminal-badge');
    if (badge) {
        const text = badge.textContent;
        badge.textContent = '';
        let i = 0;
        const typeInterval = setInterval(() => {
            badge.textContent += text[i];
            i++;
            if (i >= text.length) clearInterval(typeInterval);
        }, 60);
    }
});
