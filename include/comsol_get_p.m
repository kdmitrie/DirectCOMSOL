function p = comsol_get_p(model, coord)
coord = reshape(coord, 1, []);
coord = [real(coord); imag(coord)];

p_re = mphinterp(model, 'real(acpr.p_t)', 'coord', coord);
p_im = mphinterp(model, 'imag(acpr.p_t)', 'coord', coord);
p = (p_re - 1i* p_im) / (2i*pi);
end