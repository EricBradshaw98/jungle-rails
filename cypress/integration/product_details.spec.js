describe('example to-do app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Clicks on product name", () => {
    cy.get(".products article").first().find("a").click(); // Assuming the anchor tag is the direct child of the article
  });

  it("Clicks on add to cart button", () => {
    cy.get(".products article").each(($article) => {
      $article.find('.btn').click(); // Assuming the button has class 'btn'
    });
    });
  });

