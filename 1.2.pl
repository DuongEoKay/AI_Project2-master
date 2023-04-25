%! Utilities
% % % % % % % % % % % % % % % % % % % % % % %
not(P) :- P, !P, fail , true.
different(X, Y) :- X = Y, !, fail ; true.
% % % % % % % % % % % % % % % % % % % % % % %

%! Relationships
% % % % % % % % % % % % % % % % % % % % % % %
thai_thuong_hoang(X):- vua(X), vua(Y), cha(X,Y).

ong(X,Z):- cha(X,Y), cha(Y,Z).

quoc_lao(X):- not(vua(X)), cha(X,Y), vua(Y).

anh_em_ruot(X,Y):- cha(Z,Y), cha(Z,X), different(X,Y).

anh_em_ho(A,B):- ong(C,A), ong(C,B), different(A,B).

chu_hoac_bac(X,Y):- anh_em_ho(X,Z), cha(Z,Y).
chu_hoac_bac(X,Y):- anh_em_ruot(X,Z), cha(Z,Y).

father_in_law(X,Y):- cha(X,Z), vo_chong(Z,Y).
% % % % % % % % % % % % % % % % % % % % % % %      
%! 1st
le_khoang.
    %! 2nd
    le_tru.
        %! 3nd
        le_khang.
            %! 4th
            le_tho.
                %! so on...
                le_duy_thieu.
                    le_duy_khoang.
                        le_anh_tong.
                            le_kinh_tong.
                                le_than_tong.
                                    le_chan_tong.
                                    le_huyen_tong.
                                    le_gia_tong.
                                    le_hy_tong.
                                        le_du_tong.
                                            le_duy_phuong.
                                            le_thuan_tong.
                                                le_hien_tong.
                                                    le_ngoc_han.
                                                    le_duy_vi.
                                                        le_chieu_thong.
                                                    le_ngoc_binh.
                                            le_y_tong.
    %! 2nd
    le_thai_to.
        %! 3rd
		le_thanh_tong.
            %! 4th
			le_hien_tong.
                %! 5th
				le_tuc_tong.
				le_uy_muc.
            %! 4th
			le_tan.
                %! 5th
				le_doanh.
                    %! so on...
					le_quang_tri.
				le_sung.
					le_cung_hoang.
					le_chieu_tong.
						le_trang_tong.
						    le_trung_tong.
				le_tuong_duc.
		le_nhan_tong.
		le_nghi_dan.
    
nguyen_phi_phuc.
    nguyen_nhac.
    nguyen_hue.
        nguyen_quang_toan.


cha(le_khoang,le_tru).

    cha(le_tru,le_khang).

        cha(le_khang,le_tho).

            cha(le_tho,le_duy_thieu).

                cha(le_duy_thieu,le_duy_khoang).

                    cha(le_duy_khoang,le_anh_tong).

                        vua(le_anh_tong).
                        cha(le_anh_tong,le_kinh_tong).

                        vua(le_kinh_tong).
                            cha(le_kinh_tong,le_than_tong).

                            vua(le_than_tong).
                                cha(le_than_tong,le_chan_tong).
                                vua(le_chan_tong).

                                cha(le_than_tong,le_huyen_tong).
                                vua(le_huyen_tong).

                                cha(le_than_tong,le_gia_tong).
                                vua(le_gia_tong).
                            
                                cha(le_than_tong,le_hy_tong).
                                vua(le_hy_tong).
                                    cha(le_hy_tong,le_du_tong).
                                    vua(le_du_tong).
                                        cha(le_du_tong,le_duy_phuong).
                                        vua(le_duy_phuong).
                                        cha(le_du_tong,le_thuan_tong).
                                        vua(le_thuan_tong).
                                            cha(le_thuan_tong,le_hien_tong).
                                            vua(le_hien_tong).
                                                cha(le_hien_tong,le_ngoc_han).
                                                cha(le_hien_tong,le_duy_vi).
                                                    cha(le_duy_vi,le_chieu_thong).
                                                cha(le_hien_tong,le_ngoc_binh).
                                        cha(le_du_tong,le_y_tong).
                                        vua(le_y_tong).
                                
cha(le_khoang,le_thai_to).
    vua(le_thai_to).
    cha(le_thai_to,le_thanh_tong).

        vua(le_thanh_tong).
            cha(le_thanh_tong,le_hien_tong).
            vua(le_hien_tong).

                cha(le_hien_tong,le_tuc_tong).
                    cha(le_hien_tong,le_tuc_tong).
                    vua(le_tuc_tong).
                    cha(le_hien_tong,le_uy_muc).
                    vua(le_uy_muc).

            cha(le_thanh_tong,le_tan).
                cha(le_tan,le_doanh).
                    cha(le_doanh,le_quang_tri).
                cha(le_tan,le_sung).

                    cha(le_sung,le_cung_hoang).
                    cha(le_sung,le_chieu_tong).

                        cha(le_chieu_tong,le_trang_tong).
                        vua(le_trang_tong).

                        cha(le_chieu_tong,le_trung_tong).
                        vua(le_trung_tong).

                    cha(le_tan,le_tuong_duc).
                    vua(le_tuong_duc).

    cha(le_thai_to,le_nhan_tong).
    vua(le_nhan_tong).
    cha(le_thai_to,le_nghi_dan).

%* Trieu Dai Tay Son (tuy khong cung gia pha nha Le nhung Nguyen Hue la con re cua vua Le Hien Tong)
%* Them vo cho hon 50 vi tu thoi =))))
    cha(nguyen_phi_phuc,nguyen_nhac).
    cha(nguyen_phi_phuc,nguyen_hue).
        vua(nguyen_nhac).
        vo_chong(le_ngoc_han,nguyen_hue). %!
        vua(nguyen_hue).%!
            cha(nguyen_hue,nguyen_quang_toan). %! 
            vua(nguyen_quang_toan). %!
