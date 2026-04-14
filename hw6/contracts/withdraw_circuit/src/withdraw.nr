use dep::merkle_trees::compute_merkle_root;
use dep::std::hash::pedersen_hash;

fn main(
    //TODO: fill in inputs

    r: Field,
    index: Field,
    path: [Field; 8],
    root: pub Field,
    id: pub Field,
) {
    //TODO: implement the logic for the withdraw circuit

    let leaf = pedersen_hash([id, r]);
    let computed_root = compute_merkle_root(leaf, index, path);
    assert(computed_root == root);
}
