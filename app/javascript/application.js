// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// --- スクロールフェードインアニメーション ---
const animateOnScroll = () => {
  // 監視対象の要素を取得（.fade-in-up クラスがついているもの全て）
  const targets = document.querySelectorAll('.fade-in-up');

  // もし対象がなければ何もしない（エラー防止）
  if (targets.length === 0) return;

  // 監視のオプション（画面の下から20%の位置に見えたら発火）
  const options = {
    root: null,
    rootMargin: '0px',
    threshold: 0.2
  };

  // 監視機能の作成
  const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      // 画面内に入ったら
      if (entry.isIntersecting) {
        // activeクラスを追加してアニメーション開始
        entry.target.classList.add('active');
        // 一度表示されたら監視をやめる
        observer.unobserve(entry.target);
      }
    });
  }, options);

  // 各要素を監視対象に登録
  targets.forEach(target => {
    observer.observe(target);
  });
};

// ページ遷移（Turbo）と初回読み込みの両方に対応させるイベントリスナー
window.addEventListener("turbo:load", animateOnScroll);
window.addEventListener("DOMContentLoaded", animateOnScroll);