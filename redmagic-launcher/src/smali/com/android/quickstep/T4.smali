.class public final synthetic Lcom/android/quickstep/T4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/TaskAnimationManager;

.field public final synthetic h:Lcom/android/quickstep/BaseContainerInterface;

.field public final synthetic i:Landroid/content/Intent;

.field public final synthetic j:Landroid/app/ActivityOptions;

.field public final synthetic k:Lcom/android/quickstep/GestureState;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/BaseContainerInterface;Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/quickstep/GestureState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/T4;->g:Lcom/android/quickstep/TaskAnimationManager;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/T4;->h:Lcom/android/quickstep/BaseContainerInterface;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/T4;->i:Landroid/content/Intent;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/T4;->j:Landroid/app/ActivityOptions;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/T4;->k:Lcom/android/quickstep/GestureState;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/T4;->g:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/T4;->h:Lcom/android/quickstep/BaseContainerInterface;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/T4;->i:Landroid/content/Intent;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/T4;->j:Landroid/app/ActivityOptions;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/T4;->k:Lcom/android/quickstep/GestureState;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/quickstep/TaskAnimationManager;->b(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/BaseContainerInterface;Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/quickstep/GestureState;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
