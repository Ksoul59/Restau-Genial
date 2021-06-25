<?php

namespace App\Controller;

use App\Data\SearchData;
use App\Entity\Plats;
use App\Form\CreateProductType;
use App\Form\EditPlatType;
use App\Form\SearchForm;
use App\Repository\PlatsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    /**
     * @Route("/", name="app_home")
     */
    public function index(PlatsRepository $repository, Request $request): Response
    {
        $data = new SearchData();
        $data->page = $request->get('page', 1);
        $form = $this->createForm(SearchForm::class, $data);
        $form->handleRequest($request);
        $product = $repository->findSearch($data);
        return $this->render('product/index.html.twig', [
            'product' => $product,
            'form' => $form->createView(),
        ]);
    }

    /**
     *
     * @Route("/new_product", name="new_product")
     */
    public function newProduct(Request $request): Response
    {
        $plats = $this->getDoctrine()->getRepository(Plats::class)->findAll();

        $plats = new Plats();

        $form = $this->createForm(CreateProductType::class, $plats);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            $doctrine = $this->getDoctrine()->getManager();
            $doctrine->persist($plats);
            $doctrine->flush();

            $this->addFlash('message', 'Plat Creer avec succés');
            return $this->redirectToRoute('app_home');

        }

        return $this->render('create_product/index.html.twig', [
            'product' => $plats,
            'createProduct' => $form->createView(),
        ]);

    }
    /**
     * IsGranted("ROLE_MANAGER")
     *
     * @Route("/modifier/{id}", name="modifier_product")
     */
    public function editProduct(Plats $plats, Request $request)
    {

        $form = $this->createForm(EditPlatType::class, $plats);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($plats);
            $entityManager->flush();

            $this->addFlash('message', 'Plat modifié avec succès');
            return $this->redirectToRoute('app_home');

        }

        return $this->render('edit_product/editproduct.html.twig', [
            'product' => $plats,
            'editprodForm' => $form->createView(),
        ]);

    }

    /**
     *
     * IsGranted("ROLE_MANAGER")
     *
     * @Route("/delete/{id}", name="delete_product")
     */
    public function delete(Plats $plats): Response
    {
        $em = $this->getDoctrine()->getManager();
        $em->remove($plats);
        $em->flush();

        return $this->redirectToRoute("app_home");
    }

}
