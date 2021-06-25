<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\EditUserType;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * IsGranted("ROLE_ADMIN")
 *
 * @Route("/admin", name="admin_")
 */

class AdminController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
        ]);
    }

    /**
     * Listes des utilisateurs
     *
     * @route("/utilisateurs", name="utilisateurs")
     */
    public function userList(UserRepository $user)
    {
        return $this->render("admin/user.html.twig", [
            'user' => $user->findAll(),
        ]);
    }
    /**
     * Modif Users
     *
     * @Route("/utilisateurs/modifier/{id}", name="modifier_users")
     */
    public function editUser(User $user, Request $request)
    {
        $form = $this->createForm(EditUserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            $this->addFlash('message', 'Ulisateur Modifier avec succés');
            return $this->redirectToRoute('admin_utilisateurs');
        }
        return $this->render('admin/edituser.html.twig', [
            'userform' => $form->createView(),
        ]);
    }

}
