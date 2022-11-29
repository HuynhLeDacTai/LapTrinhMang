-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221103.3a7b77d22e
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 29, 2022 lúc 02:35 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ltm`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` int(1) DEFAULT NULL,
  `image` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `name`, `phone`, `mail`, `username`, `password`, `role`, `image`) VALUES
('1', 'NVA', '012393823', 'vanA@gmail.com', 'admin', '123', 1, 'https://tiemanhsky.com/wp-content/uploads/2020/03/61103071_2361422507447925_6222318223514140672_n_1.jpg'),
('2', 'NVC', '0907123678', 'vanC@gmail.com', 'user01', '123', 0, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUSEhgRERURERgSERIREhISEhERGBIRGBgZGRgYGBgcIS4lHB4rIRgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHhISHjQrISE0MTQ0NDQ0NDQxNDQxNDY2NDQ0NDQxNDQ0NDQ0MTQ0NDE0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIARMAtwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAAAQIDBAUGBwj/xABBEAACAQIEAwQHBQYEBwEAAAABAgADEQQSITEFQVEGYXGBEyIyQpGhsQcUUsHwI2KSstHhQ1NygiQlMzR0osIV/8QAGgEBAAIDAQAAAAAAAAAAAAAAAAECAwQFBv/EACYRAQACAgICAgICAwEAAAAAAAABAgMRBDEhQRJREyIFMkJhgZH/2gAMAwEAAhEDEQA/ANfARx2nbccoRwgKEdoQFFeOFoSVojHERIBFGZjvigOnjeRNojtMVmel8UqTFKeYlga+2smLRPSJrMdnCAMclBwhFAIRGEgEREcDAjCEISvtCEJKBCEcAijhARkWYDnIYisEUseU5vF8RZz7QA6Dn8Zhy5q077ZsWG1+um7rY1QbXBPiBK1xo/WvwM5qtUsLj9fCYYx7X00INt95qxy5n02Z4sR7dTj+IW9VTvv3GaWtjH6jzuZivXFtSb8zeQsDqHYfBhMF81rTtmpirWF5xzW1sfjL8LxYqdD5G1vKawsDodGHTS/5RKgY/hP63EpF7RO4laa1nxMOtw3Fw3tAjvXUTZo4YXBvOHpI41BAtz5W8Ju+G483s2h6HY+E2sXKnerNbJxo1uroISFJ8wuJZN+J35hpTGvBGFo4QhGKShaBAiElCBbFAwkhwhCEiBMJj4urlQnu08ZEzqNyRG500XaDF5jkB0XcDm00Yfuv46zLxQLMbk+HU98xVUKdbfMzj5LTa0zLrUr8axEG9TS3LpbT4zApgM2UaXJJPRbazOxDi3s38bj5zAp+1zF9LSi0tgSg6m3Ifr6zHqLfVNLb20MhduRtY8/7S+7W9YWPJh9YSpf1hcjbcjl5SVLXTz1litbUi19D08ZDKUJB1F+W46EQhmUJcp108R39bTCLH211HO3Tw6zKQakc9GHf0P66wlvOF4u7ZDNxOVovlIYciD5c/wBd06ei+ZQw5gGb/EvuJrPpocqmpi0e04Rwm61ChaEIChGISA7xXivFeSJgwvI3iJgTJms4tUsoA5m0zy00naKqVVSBzOvTSYc+4xzplwebxtrKxsNbXPXSw6zGp082uu/SXLTNQADW9r+Vtz5/Odr2e7OBVDuLsdddbeA2nGtbUOzSu5c3guEO/u372vpNpR7JKTdvV8J29HBqugA/vMpKA6TBN5Z4pVxD9mUGgHiTNVj+APTByC4756kcMLSmtgwRt9JEXlM0q8gGEOoK2tvpK2pActt9OU9Obg6ioDluHBVu4jUH5ETA4n2WDK3oxZhex6jl/SZIyfbHbFHpwNOguYju/X1kXp9/sgDyBsZtP/yKi1PZa+1rXOVl5+BExeKYJ6YzMCBn3tsG3+hl4tEypNJiEV1TvI+e/wBZu+DvemB0J+G854OEUX20Pl+rTd9nWzUsw5sbzd4n9/8AjR5X9P8ArbxGOFp03OKEcUAEI4QKbxEyOaBaBItFmkCYXgTLTR9pv+mv+q1u+03F5ruNU89I88pDaTHmjdJhfFOrxKvslgs51F/W7z+uc9Sw1LKgHScX9n1MEMegHzndFrb6Tz+Sf207+OP1K0mgmKMan4hvz0mXh8Sh2IPfMfxlliV6rApLksZIpGk7Y4pd0HWZBAG8gzrzIEnRtgVMOpNyBcc5ruN4FalJlIBuNdJt3db2BF5S4BFpERMSifLw/jaFGCW2vr12A/OdD2apFaOotckyrtphAuJso3tptvNvh0yoq9ABOvwo3'),
('3', 'BVH', '129838912', 'Huy@gmail.com', 'user02', '123', 0, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBEVFRgVEhISEhIYGRISGBkYGBERGBEYGBgZGRgYGBgcIS4lHB4sHxgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHhISHDQrJCE0NDUxNDQ0NDQ0NDQ0NDE0MTQxNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQxNDQ0NDQ0NDQ0NP/AABEIARMAtwMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAABAAIDBAUGB//EAD0QAAIBAgMECAQEBAUFAAAAAAECAAMRBCExBRJBUSJhcYGRobHwBjLB0RNCYuEzUqLxFCNywtIWQ1OCkv/EABkBAQADAQEAAAAAAAAAAAAAAAABAgQFA//EACIRAQEBAAICAgMBAQEAAAAAAAABAgMRITEEQRJRcWFCIv/aAAwDAQACEQMRAD8AjMMUbO24xQRRQFFFBAMEUEAwQSrU2hRW96idHXpDw7ZFsnsktWoJgf8AVNLijgXA/KfrGYj4mQN0F31F73upPK087zY/b0nDvvrp0UUy6e3cOV3i+6eK5kg9ksYLaFOqCUbTIg5Ed0vN5vqq3Gp7i1BETBLKjFBFAMUEUAxQRQDFBFAtxsUEBRRRQBFFBAV5XxmMSmL1GtyGpPYIcXilpoXY6aDmeQnFYvFPVfefO+VuCjgBPHm5pif69uHhu7/ixtLblZyyodxDlkBvEdbcO6ZKgZ6i+WukmemddJB+IBmReYNcl1e66GeKZnUP/wAK75qpbW9hodTeWDsp9zf3de247u/ykSbRdbWt2AW7NJonabNTPVYj9M8ra9ZmMYgi4IjSeB92k7YgkkkA8SOY6o5qSvplx7RLSouYuYDbVZDYnfXIWbPwM63C4pHUMhuD4jqPXOA3GXL+xk+Exr0jdGIvnbge0TTxc9z416ZebgmvOfbvrxSls7GrVQMNcgw5G0tzdLLO4wWdXqnRQXivJQdFGwwDFFFAsmCGCAjBCYICjHYAXOXGGYvxJiiqBF1fX/SNR3/eV3r8c2r4z+WpGFtTaBrubMdwGyC2v6u+BKQUXYXPC4AkeGo53PD3aSuSTc9ndynJ3q713XVxmYnUQViTkO/rlR6BMvshJsO+T4WgN1nOgsB+pjp4a+Ei2R6Sdsf/AA5PD379ZoYTDNutle48MrzToYO+6LZnPv0/bum1svZwZCbfMXI7OHkRPPWl85cSmHKtmNDaEjdNh2j374To9p4GzrYZOt+8f3MwsRQYd3lLZ12rrPSOnVta4uDwPPqgxGGv0kOWtuUeE15HPsPvzHXEhy8j28PGXU7N2VtFqL/oNt4cx1dc7dTPP6qZ20nWbAxRekAfmXonu0mz42/+axfKx1/6jVhjbw3mxiGGNhgOijbxQLZiMURgCNMJjTARM5H4hxQeruDRBY9bcfDTxnXTglJeqTrdmbtuSTM3ytdZ6/bV8XPeu/0uZAAW64FX377vOFRvG47B46w+/tOdHRqSmlgTxPRHXfWX2wvyU14Zn/UdT12sfARuFp3cD8qC7dupM3fh/CmoWqkWADBb+F/C3hKar1zFc4cKzW0RVQXzzUF/G4XxnQbNw26gsMh9NfSZ1YA7u7+dy39Vz/ShnS4alZAPfOUr0jl9t4ToKRqr7ncTb0mTtPA5BwLbwDdhtc++qdVt2kPwnB0IDf1f28ZA1APRF+I9CbRL15Rqd+HnFdN08rnw92kTizcg2XYR785q7VoWJuLX6J6mGn08Zkb10I/Mmfh78p7TXbPrPVGqlxLvwxVIdlPEeYlN36Nx792HjBsM2rqOd/Se3Detx4807xXZw3jYp03LPvFGw3koOigigXY0wxpgIxphMaYAacNRUhqhHC6C+pubfSdvVZgDujebOw5ngJxZVgvSvvFi5vlmBy4ZzH8uzqRt+JL3atYVMieWQ+nrJMMBvE8B6DL7xuHqWpAnUn7287SBagHRv'),
('4', 'TLG', '120384712', 'LeG@gmail.com', 'admin02', '123', 1, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYVFRgVFREYGBgYGhgaGBgYGhgYGBgYGhgaGhoaGhgcIS4lHB4rIxgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHhISHjQrJCQ0NjQ0NDQ0NDQ0NjQ2NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIAQ0AuwMBIgACEQEDEQH/xAAbAAAABwEAAAAAAAAAAAAAAAAAAQIDBAUGB//EADsQAAEDAgMFBwMEAQMDBQAAAAEAAhEDIQQxQQUSUWGBBiJxkaGx8DLB0RNC4fFSI2KycpLCBxQWgtL/xAAaAQACAwEBAAAAAAAAAAAAAAAAAgEDBQQG/8QAKBEAAgIBBAICAgIDAQAAAAAAAAECEQMEEiExBUFRYTKBInGRobET/9oADAMBAAIRAxEAPwB1yJGUkr0J4OQCiQKJBAESMokABEgiQSGiQRSgmg0EUoSgA0EmUUoJoWgkyhKADQRSjQAlEUaIqCQFJKNEglASmlIKNQ1Y8HRMRFAoimOcJBBBABIIIigAIkCkkoGSASiJSSUzUqQlbosjBydIeL0W+qzE7SYzW/AKKNsg5NK55arHF1ZoQ8bmkrS/yXu8hvqop7SDtYU1lYHVWQzQkrTKMukyYnUkSw5KBUZr04HK2zncaHZQSAUoFAlAKBQRIABRI0SCQihKBRIGTomIijRKSgCJGiQAElGiKCUAlNuKNxUTHYoMaXHTLmeCSUlFWy7Hjc5KMVywsVimsEuMLOYzarn2bYep6qFjsY6o6SbcNAOSil2iyc+plN1HhHqdHoIYVuly/wDhIa6/E8dEHuMTl1+yQwJdRtpzPBchpkc1yMiU5h8e8H6imntKRVpxHFTGTXRVOKfaNPgNpkwHeaumOWGw7ytBsvG2AJ/j+F3afVNPbJ/sy9d4+MoueNU12i8BSgU21yUFqHnWhxGkgo0CAKJGUSACKJGUSBkS0EESkoAiRokAEUlxSikOKB0IcVj9t43ffAPdZYczqfnDmtBtjE7lMxm7ujrmeglZAiPmqzdbl6gv2eh8Rplzll/SG4RtGqXupYbP4Wab9AptU6lQkwAhg8OXGPVbHZOxgACRc6KuUqLYwvlmYo7He42ZbRRcds0tdcLqNDAADJQtp7Ia8G10u6QzjF8HMadAg5KQzumf+4cuKn4/DGi4tc3unX8Klq1iHeGXh/XsnTsrlGjU4DEbwibj1GhU4FZXZuK3XC9h/wATmPnBalpW1pMu+NPtHlfKaZYsu6PT5/YsFKSAlrsMlgRFGgUAJKCBQQSiUggiUlAEEERQSgimnFOEpioUrdFsI26KHbtWXbv+Inqf6VIGZdSfYKxxZ33OPEn8KLUGZHKPt7rAyT3zb+T2+nwrFijFekMNv1Kk4enJ9khtO3p+VP2c0SO8ATYSbAakquTOiC55ND2d2bJBjLPxzHzwW4w+GDQLKFsKiwMAY8OjUEGTqVcgKui2UvSGwxM4hllJe8C5ICrcRtfDtMGsyfGfZTQtlJtvZwqMcCPnFcx2hRcxxac2rsb6rHjuPDuMH7Ln3bPA7rt8Cx91EeGEuYmawFWHAcclsNmVt5satt00+clhsO+HtHP3stTsWr3yP8h6j+yu/ST25F98GV5HH/6YH8rkvQlgpsJYWweUYpEjRFSKEUECgglElBBBSUgSSjSSglCXFQsdUhjjyUt5VVtep3Y4qjPLbjbO/QY9+eK+ymdw42SHifNG45Jt79dB9/gWCe1FOEwB1+evkrnB/wDtWNArOG8c7nPhY6BV+Ew7nwAL+GS0eD7Nb9ENc5zDJLt394dG813Fp3W25KOLJppcIt9k4ejIfRfYcDItoVqaTpCpMBs3ca3vEw0hznSXvJcXFz3E3dvFxnmVb4M2KX2T6Im1KIeN1xMcjCzdfF4Kk/cfuF2oMujxzhanE096R');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
('H1', 'Nike'),
('H2', 'Adidas'),
('H3', 'Puma'),
('H4', 'Bitis');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id_product` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id_category` varchar(10) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id_product`, `name`, `id_category`, `size`, `price`, `image`) VALUES
('1', 'Nike Air Max', 'H1', 42, 500000, 'https://cdn.vuahanghieu.com/unsafe/500x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/04/giay-the-thao-nike-air-max-genome-white-cw1648-100-mau-trang-626279b6da32c-22042022164734.jpg'),
('10', 'Hunter X', 'H4', 44, 453000, 'https://product.hstatic.net/1000230642/product/dsmh10500xam__2__4d84d50f5d9741f6b6d74dcd716f4176_grande.jpg'),
('11', 'DSM07600TRG', 'H4', 43, 770000, 'https://product.hstatic.net/1000230642/product/dsc_0153_2149393560ad4d06bfc742b4b41d8447_grande.jpg'),
('12', 'Hunter Street X', 'H4', 42, 890000, 'https://product.hstatic.net/1000230642/product/dsc_0322_f651c011422f49fe8604577217411fcf_grande.jpg'),
('2', 'Nike Precison 5', 'H1', 43, 560000, 'https://cdn.vuahanghieu.com/unsafe/500x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/11/giay-bong-ro-giay-nike-precision-5-black-white-cw3403-003-mau-den-trang-size-42-637afbe868fef-21112022111744.jpg'),
('3', 'Nike Air Force 1', 'H1', 42, 800000, 'https://cdn.vuahanghieu.com/unsafe/500x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/10/giay-the-thao-nike-air-force-1-07-pecan-dh7561-100-mau-trang-nau-size-42-6348cbeab4a18-14102022093938.jpg'),
('4', 'Pureboost', 'H2', 43, 650000, 'https://cdn.tgdd.vn/Products/Images/9980/282658/giay-chay-bo-nam-adidas-solar-glide-5-m-gx6703-thumb-1-600x600.jpg'),
('5', 'Ultraboost', 'H2', 44, 970000, 'https://cdn.tgdd.vn/Products/Images/9980/282602/giay-chay-bo-nu-adidas-ultraboost-22-w-gx5928-thumb-1-600x600.jpg'),
('6', 'Solar CX6703', 'H2', 43, 760000, 'https://cdn.tgdd.vn/Products/Images/9980/282592/giay-chay-bo-nam-adidas-solar-glide-5-m-gx6705-210622-053056-600x600.jpg'),
('7', 'Puma Softride Feel', 'H3', 44, 453000, 'https://sneakerdaily.vn/wp-content/uploads/2022/11/Giay-Reebok-_Flexagon-TR-3_-Nam-GZ8262.jpg'),
('8', 'Skye Clean Metallic', 'H3', 42, 670000, 'https://sneakerdaily.vn/wp-content/uploads/2022/11/giay-adidas-forum-exhibit-low-sky-tint-gw6348-6.jpg'),
('9', 'RS-X The Batman', 'H3', 44, 760000, 'https://sneakerdaily.vn/wp-content/uploads/2022/10/giay-puma-rs-x-the-batman-383290-01.png');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_tk` (`id_category`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_tk` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
