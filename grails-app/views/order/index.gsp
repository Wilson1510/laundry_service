<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Laundry</title>
        <script>
            const images = ["pakaian.png", "cuci baju.jpg", "antar laundry.jpg", "logo laundry.png"];
            const descriptions = ["Pakaian kotor menumpuk?",
                "Tidak sempat dicuci?",
                "Kami hadir untuk anda",
                "Laundry berkualitas dan lengkap"];
            let dot = 0;
            let hapus = false;
            let currentIndex = 0;
            const total = 4;
            function displayImage(imageUrl, desc) {
                let newDiv = $('<div>').attr({id: 'slider-content', class: 'slider-content'}).css('transform', 'translateX(100%)');
                let newImage = $('<img>').attr({src: '/assets/'+imageUrl});
                let newH1 = $('<h1>').text(desc);
                newDiv.append(newImage);
                newDiv.append(newH1);
                $('#slider').append(newDiv);
                const dots = document.querySelectorAll('.span');
                // Menggeser gambar
                setTimeout(() => {
                    $('#slider .slider-content').eq(0).css('transform', 'translateX(-100%)');
                    newDiv.css('transform', 'translateX(0)');
                    if (hapus){
                        $('#slider .slider-content').eq(0).on('transitionend', function() {
                            $(this).remove();
                        });
                        dots[dot].classList.remove('active2');
                        dot = (dot + 1) % dots.length;
                        dots[dot].classList.add('active2');
                    };
                    currentIndex = (currentIndex + 1) % total;
                    hapus = true;
                }, 100);
            }
            $(document).ready(function(){
                displayImage(images[currentIndex], descriptions[currentIndex])
                setInterval(() => {
                    displayImage(images[currentIndex], descriptions[currentIndex]);
                }, 3000);
            })
        </script>
    </head>
    <body>
        <!-- nav -->
        <nav>
            <div class="logo">
                <img src="${assetPath(src: 'logo laundry.png')}" alt="Washaholic Laundry Services Logo">
            </div>
            <div class="nav-menu" id="navMenu">
                <div class="nav-menu-item">
                    <a href="#tentang" class="menu-item">Tentang</a>
                    <a href="#layanan" class="menu-item">Layanan</a>
                    <a href="#lokasi" class="menu-item">Lokasi</a>
                    <a href="#testimoni" class="menu-item">Testimoni</a>
                </div>
                <div class="hamburger" onclick="toggleMenu()">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <a href="https://wa.me/62895600126401" class="btn-pesan">Pesan</a>
            </div>

        </nav>

        <!-- slider -->
        <div class="slider-page">
            <div id="slider" class="slider"></div>
            <div id="indicator" class="indicator">
                <span class="span active2">1</span>
                <span class="span">2</span>
                <span class="span">3</span>
                <span class="span">4</span>
            </div>
        </div>

        <!-- tentang -->
        <div id="tentang" class="tentang">
            <h1 class="judul">Tentang Kami</h1>
            <h1>Washaholic</h1>
            <p>Selamat datang di Washaholic! Kami adalah layanan laundry profesional yang berkomitmen
            untuk memberikan kenyamanan dan kebersihan terbaik untuk kebutuhan pakaian Anda. Berdiri
            sejak 2021, kami telah melayani pelanggan dengan berbagai solusi laundry, mulai dari cuci
            kering, setrika, hingga layanan antar-jemput.</p>
            <p>Di Washaholic, kami memahami pentingnya pakaian yang bersih dan rapi dalam mendukung
            aktivitas harian Anda. Dengan dukungan peralatan modern dan staf yang berpengalaman, kami
            memastikan setiap pakaian mendapatkan perawatan yang maksimal agar selalu tampak seperti
            baru</p>
            <p class="alasan">Mengapa memilih kami?</p>
            <ul>
                <li><b>Kualitas Terjamin</b>: Kami menggunakan deterjen berkualitas dan teknologi cuci yang
                ramah lingkungan.</li>
                <li><b>Cepat dan Efisien</b>: Proses laundry yang cepat tanpa mengorbankan hasil akhir.</li>
                <li><b>Layanan Pelanggan yang Ramah</b>: Kami siap membantu dan mendengarkan kebutuhan
                Anda dengan sepenuh hati.</li>
                <li><b>Layanan Antar-Jemput</b>: Kemudahan layanan laundry di ujung jari Anda</li>
            </ul>
        </div>

        <!-- layanan -->
        <div id="layanan" class="layanan">
            <h1 class="judul">Layanan</h1>
            <div class="layanan-container">
                <div class="layanan-card">
                    <asset:image src="laundry-kiloan.jpg" alt="Laundry Kiloan"/>
                    <div class="content">
                        <h3>Kiloan Cuci Setrika</h3>
                        <p>Layanan lengkap untuk pakaian sehari-hari dengan sistem per kilogram. Pakaian Anda akan
                        dicuci, dikeringkan, dan disetrika dengan rapi, siap dipakai kapan pun Anda butuhkan.</p>
                        <div class="harga">Rp8.000/Kg</div>
                    </div>
                </div>

                <div class="layanan-card">
                    <asset:image src="laundry-ekspress.jpg" alt="Laundry Ekspres 24 Jam"/>
                    <div class="content">
                        <h3>Ekspres 24 Jam</h3>
                        <p>Untuk Anda yang butuh layanan cepat, kami menawarkan laundry ekspres dengan proses
                        maksimal 24 jam. Cocok bagi yang memiliki jadwal padat namun ingin pakaian tetap bersih dan
                        wangi.</p>
                        <div class="harga">Rp12.000/Kg</div>
                    </div>
                </div>

                <div class="layanan-card">
                    <asset:image src="laundry-ekspress.jpg" alt="Laundry Ekspres 3 Jam"/>
                    <div class="content">
                        <h3>Ekspres 3 Jam</h3>
                        <p>Layanan khusus bagi Anda yang membutuhkan pakaian dalam waktu singkat. Hanya dalam 3
                        jam, pakaian Anda bersih, rapi, dan siap digunakan!</p>
                        <div class="harga">Rp16.000/Kg</div>
                    </div>
                </div>

                <div class="layanan-card">
                    <asset:image src="laundry-bed-cover.webp" alt="Laundry Bed Cover"/>
                    <div class="content">
                        <h3>Bed Cover</h3>
                        <p>Jaga kebersihan tempat tidur Anda dengan layanan cuci khusus bed cover. Kami menggunakan
                        metode pencucian yang lembut namun efektif agar bed cover tetap nyaman dan tahan lama.</p>
                        <div class="harga">Rp30.000/Pcs</div>
                    </div>
                </div>

                <div class="layanan-card">
                    <asset:image src="laundry-setelan.webp" alt="Laundry Setelan"/>
                    <div class="content">
                        <h3>Setelan</h3>
                        <p>Pakaian formal Anda seperti setelan jas dan pakaian kerja membutuhkan perawatan khusus.
                        Kami menyediakan layanan pencucian khusus untuk menjaga kualitas dan kebersihan setelan
                        Anda.</p>
                        <div class="harga">Rp25.000/Pcs</div>
                    </div>
                </div>

                <div class="layanan-card">
                    <asset:image src="laundry-sepatu.webp" alt="Laundry Sepatu"/>
                    <div class="content">
                        <h3>Sepatu dan Tas</h3>
                        <p>Bersihkan sepatu dan tas Anda dengan perawatan khusus. Kami memastikan setiap detailnya
                        bersih dan terawat, sehingga terlihat seperti baru kembali.</p>
                        <div class="harga">Rp30.000/Pcs</div>
                    </div>
                </div>
            </div>
            <p class="keterangan-layanan">*Gratis antar-jemput. Untuk pakaian biasa minimal 1 kg dan tidak menerima pakaian dalam.</p>
        </div>

        <!-- lokasi -->
        <div id="lokasi" class="lokasi">
            <h1 class="judul">Lokasi</h1>
            <div class="lokasi-container">
                <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d304.86106908598424!2d119.42225754338305!3d-5.144395536579292!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sid!4v1730109827634!5m2!1sen!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>

                <div class="info">
                    <p>Nama Outlet: Washaholic Laundry</p>
                    <p>Nomor Telepon: 0895600126401</p>
                    <p>Jam Buka: Setiap Hari, 07.00 - 22.00</p>
                    <p>Alamat: Jl. Gunung Nona No.8, Makassar, Sulawesi Selatan</p>
                </div>
            </div>
        </div>

        <!-- testimoni -->
        <div id="testimoni" class="testimoni">
            <h1 class="judul">Testimoni</h1>
            <button id="left-btn" class="nav-btn left">&lt;</button>

            <div class="testimoni-wrapper">
                <div class="testimoni-container">
                    <div class="testimoni-card">
                        <h3>Andi</h3>
                        <p><strong>Layanan:</strong> Kiloan Cuci Setrika</p>
                        <p>"Wah, puas banget sama pelayanan di Washaholic Laundry!
                        Baju-baju jadi super bersih, wangi, dan rapi banget.
                        Mereka cepet juga, jadi nggak perlu nunggu lama.
                        Pokoknya recommended banget deh buat yang nyari laundry praktis dan terjangkau!"</p>
                        <p>⭐⭐⭐⭐⭐</p>
                    </div>
                    <div class="testimoni-card">
                        <h3>Siti</h3>
                        <p><strong>Layanan:</strong> Laundry Ekspres 3 Jam</p>
                        <p>"Aku bener-bener kagum sama layanan mereka!
                        Dalam waktu 3 jam, baju-baju aku udah rapi, bersih, dan wangi.
                        Nggak ada noda yang ketinggalan, semuanya dikerjain dengan rapi banget.
                        Nggak nyangka bisa dapet laundry secepat ini dengan kualitas sebaik ini!"</p>
                        <p>⭐⭐⭐⭐⭐</p>
                    </div>
                    <div class="testimoni-card">
                        <h3>Budi</h3>
                        <p><strong>Layanan:</strong> Sepatu dan Tas</p>
                        <p>"Sepatu sama tas favoritku keliatan kayak baru lagi, seriusan!
                        Mereka bisa ngebersihin noda-noda yang aku pikir udah permanen.
                        Prosesnya cepat dan harganya juga masih masuk akal.
                        Salut banget sama tim Washaholic!"</p>
                        <p>⭐⭐⭐⭐⭐</p>
                    </div>
                    <div class="testimoni-card">
                        <h3>Ayu</h3>
                        <p><strong>Layanan:</strong> Setelan</p>
                        <p>"Serius, aku nggak pernah nemu tempat laundry yang hasilnya serapi ini!
                        Setelan kerja aku jadi licin, bebas kusut, dan wangi banget.
                        Mereka juga ramah dan cepat dalam pengerjaan.
                        Rasanya worth it banget, jadi bakal langganan deh!"</p>
                        <p>⭐⭐⭐⭐⭐</p>
                    </div>
                    <div class="testimoni-card">
                        <h3>Rizky</h3>
                        <p><strong>Layanan:</strong> Bed Cover</p>
                        <p>"Bed cover aku jadi bersih banget, sampe wangi seger dan lembut waktu disentuh.
                        Enak banget buat dipake tidur sekarang.
                        Pokoknya nggak ada lagi bau atau noda yang tersisa.
                        Bakal terus laundry di sini kalau bed cover udah butuh dicuci lagi!"</p>
                        <p>⭐⭐⭐⭐⭐</p>
                    </div>
                </div>
            </div>

            <button id="right-btn" class="nav-btn right">&gt;</button>
        </div>

        <!-- footer -->
        <footer>
            <div class="footer-info">
                <div class="footer-logo">
                    <asset:image src="logo laundry.png" alt="Logo Washaholic Laundry"/>
                    <p>Layanan Handal, Berkualitas dan Lengkap</p>
                </div>
                <div class="footer-medsos">
                    <p>Ikuti Kami:</p>
                    <div style="margin-bottom: 8px;">
                        <a href="https://www.instagram.com/Washaholic_laundry" target="_blank">
                            <asset:image src="instagram.png" alt=""/>
                            @Washaholic_laundry
                        </a>
                    </div>
                    <div>
                        <a href="https://wa.me/62895600126401" target="_blank">
                            <i class="fab fa-whatsapp"></i>
                            <asset:image src="whatsapp.png" alt=""/>
                            +62 895-6001-26401
                        </a>
                    </div>
                </div>
            </div>

            <!-- Bagian kedua: Hak Cipta -->
            <div class="copyright">
                <p>&copy; 2024 PT Washaholic Makassar</p>
            </div>
        </footer>
        <!--  -->
        <script>
            const container = document.querySelector('.testimoni-container');
            const leftBtn = document.querySelector('#left-btn');
            const rightBtn = document.querySelector('#right-btn');

            rightBtn.addEventListener('click', () => {
                container.scrollBy({ left: container.clientWidth, behavior: 'smooth' });
            });

            leftBtn.addEventListener('click', () => {
                container.scrollBy({ left: -container.clientWidth, behavior: 'smooth' });
            });

            /* Menyembunyikan tombol jika sudah berada di ujung */
            container.addEventListener('scroll', () => {
                const maxScrollLeft = container.scrollWidth - container.clientWidth;
                leftBtn.style.display = container.scrollLeft > 0 ? 'flex' : 'none';
                rightBtn.style.display = container.scrollLeft < maxScrollLeft ? 'flex' : 'none';
            });
        </script>
        <script>
            // JavaScript function to toggle the menu
            function toggleMenu() {
                const hamburger = document.querySelector(".hamburger");
                const navMenuItem = document.querySelector(".nav-menu-item");
                const menuItem = document.querySelectorAll(".menu-item");
                hamburger.onclick = function(){
                    navMenuItem.classList.toggle("active");
                }
                menuItem.forEach(n => n.addEventListener("click", ()=> {
                    navMenuItem.classList.remove("active");
                }))
            }
        </script>
    </body>
</html>