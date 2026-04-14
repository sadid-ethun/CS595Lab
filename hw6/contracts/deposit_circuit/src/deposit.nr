use dep::merkle_trees::compute_merkle_root;
use dep::std::hash::pedersen_hash;

fn main(
    //TODO: fill in inputs

    id: Field,
    r: Field,
    oldPath: [Field; 8],
    oldRoot: pub Field,
    newRoot: pub Field,
    commitment: pub Field,
    index: pub Field,
) {
    //TODO: implement the logic for the deposit circuit
    
    assert(commitment == pedersen_hash([id, r]));
    let empty_leaf: Field = 0x2df8b940e5890e4e1377e05373fae69a1d754f6935e6a780b666947431f2cdcd;
    let old_root_computed = compute_merkle_root(empty_leaf, index, oldPath);
    assert(old_root_computed == oldRoot);
    let new_root_computed = compute_merkle_root(commitment, index, oldPath);
    assert(new_root_computed == newRoot);
}
