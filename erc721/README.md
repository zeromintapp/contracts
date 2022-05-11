# ERC721

### Generate Go code

```sh
web3 generate code --abi ERC721WithURI.abi --pkg erc721WithURI --out erc721WithURI.go
```

```sh
web3 generate code --abi ERC721WithID.abi --pkg erc721WithID --out erc721WithID.go
```

Then manually update the package name at the top of the generated Go file to `erc721`.
