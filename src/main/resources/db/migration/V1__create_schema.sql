CREATE TABLE credit_card (
    id UUID PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    customer_id UUID NOT NULL,
    last_numbers VARCHAR(255),
    brand VARCHAR(255),
    exp_month INT,
    exp_year INT,
    gateway_code VARCHAR(255)
);

CREATE TABLE payment_settings (
    id UUID PRIMARY KEY,
    credit_card_id UUID,
    gateway_code VARCHAR(255),
    method VARCHAR(50) NOT NULL
);

CREATE TABLE invoice (
    id UUID PRIMARY KEY,
    order_id VARCHAR(255) NOT NULL,
    customer_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    created_by_user_id UUID,
    last_modified_date TIMESTAMP WITH TIME ZONE,
    last_modified_by_user_id UUID,
    version INT,
    issued_at TIMESTAMP WITH TIME ZONE,
    paid_at TIMESTAMP WITH TIME ZONE,
    canceled_at TIMESTAMP WITH TIME ZONE,
    expires_at TIMESTAMP WITH TIME ZONE,
    total_amount NUMERIC(19, 2),
    status VARCHAR(50) NOT NULL,
    cancel_reason VARCHAR(255),
    payer_full_name VARCHAR(255),
    payer_document VARCHAR(255),
    payer_phone VARCHAR(255),
    payer_email VARCHAR(255),
    payer_address_street VARCHAR(255),
    payer_address_number VARCHAR(255),
    payer_address_complement VARCHAR(255),
    payer_address_neighborhood VARCHAR(255),
    payer_address_city VARCHAR(255),
    payer_address_state VARCHAR(255),
    payer_address_zip_code VARCHAR(255),
    payment_settings_id UUID REFERENCES payment_settings(id)
);

CREATE TABLE invoice_line_item (
    invoice_id UUID REFERENCES invoice(id) ON DELETE CASCADE,
    number INT,
    name VARCHAR(255),
    amount NUMERIC(19, 2)
);