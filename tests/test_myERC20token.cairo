use array::ArrayTrait;
use result::ResultTrait;
use debug::PrintTrait;
use option::OptionTrait;
use traits::Into;
use starknet::ContractAddress;
use zeroable::Zeroable;
use starknet::contract_address::contract_address_const;


fn setup() -> felt252 {
    let totSupply: u256 = u256 {high: 1000000, low: 0};
    let mut deploy_data = ArrayTrait::new();
    deploy_data.append('testToken');
    deploy_data.append('TST');
    deploy_data.append(18);
    deploy_data.append(totSupply.low.into());
    deploy_data.append(totSupply.high.into());
    deploy_data.append(0);
    let contract_address = deploy_contract('myERC20token', @deploy_data).unwrap();
    contract_address
}

