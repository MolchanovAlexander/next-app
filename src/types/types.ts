export type MenuType = {
    id: string;
    slug: string;
    title: string;
    desc?: string;
    img?: string;
    color: string;

}[];

export type ProductType = {
    id: number;
    title: string;
    desc?: string;
    img?: string;
    price: number;
    options?: { title: string; additionalPrice: number }[];
  };

  /*
  git push https://github.com/MolchanovAlexander/next-app.git
  Username: MolchanovAlexander
  Password: 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
  */