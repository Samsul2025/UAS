<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>@yield('title', 'Akuntansi')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    @stack('styles')
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <div class="container-fluid">
            <a class="navbar-brand" href="{{ url('/') }}">Akuntansi</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="mainNavbar">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <!-- Transaksi -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="menuTransaksi" data-bs-toggle="dropdown">
                            Transaksi
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="{{ route('journals.index') }}">Jurnal Umum</a></li>
                            <li><a class="dropdown-item" href="{{ route('journals.penyesuaian') }}">Jurnal Penyesuaian</a></li>
                            <li><a class="dropdown-item" href="{{ route('journals.penutup') }}">Jurnal Penutup</a></li>
                            <li><a class="dropdown-item" href="#">Buku Besar</a></li>
                            <li><a class="dropdown-item" href="#">Kas & Bank</a></li>
                        </ul>
                    </li>

                    <!-- Master Data -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="menuMaster" data-bs-toggle="dropdown">
                            Data Master
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="{{ route('accounts.index') }}">Daftar Akun</a></li>
                            <li><a class="dropdown-item" href="#">Periode Akuntansi</a></li>
                            <li><a class="dropdown-item" href="#">Unit / Departemen</a></li>
                        </ul>
                    </li>

                    <!-- Laporan -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="menuLaporan" data-bs-toggle="dropdown">
                            Laporan
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="{{ route('laporan.neraca-saldo') }}">Neraca Saldo</a></li>
                            <li><a class="dropdown-item" href="{{ route('laporan.laba-rugi') }}">Laba Rugi</a></li>
                            <li><a class="dropdown-item" href="#">Neraca</a></li>
                            <li><a class="dropdown-item" href="#">Perubahan Modal</a></li>
                            <li><a class="dropdown-item" href="#">Arus Kas</a></li>
                        </ul>
                    </li>

                    <!-- Pengaturan -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="menuPengaturan" data-bs-toggle="dropdown">
                            Pengaturan
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Manajemen User</a></li>
                            <li>
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf
                                    <button class="dropdown-item" type="submit">Logout</button>
                                </form>
                            </li>
                        </ul>
                    </li>
                </ul>

                <span class="navbar-text text-white">
                    {{ Auth::user()->name ?? 'Guest' }}
                </span>
            </div>
        </div>
    </nav>


    <div class="container mt-4">
        @yield('content')
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    @stack('scripts')
</body>
</html>
