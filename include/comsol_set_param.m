function comsol_set_param(model, name, value)
    model.param.set(name, sprintf('%f+(%f)*i', real(value), imag(value)));
end