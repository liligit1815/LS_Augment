.class public final LX1/e$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PersistentBubbleStashController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LX1/e;->R(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:LX1/e;


# direct methods
.method constructor <init>(LX1/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, LX1/e$a;->g:LX1/e;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(LX1/e;)V
    .locals 0

    .line 1
    invoke-static {p0}, LX1/e$a;->b(LX1/e;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final b(LX1/e;)V
    .locals 0

    .line 1
    invoke-static {p0}, LX1/e;->K(LX1/e;)Lcom/android/launcher3/taskbar/N2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "taskbarInsetsController"

    .line 8
    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LX1/e$a;->g:LX1/e;

    .line 7
    .line 8
    invoke-static {p1}, LX1/e;->a(LX1/e;)LX1/b$c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const-string p1, "controllersAfterInitAction"

    .line 15
    .line 16
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    :cond_0
    iget-object p0, p0, LX1/e$a;->g:LX1/e;

    .line 21
    .line 22
    new-instance v0, LX1/d;

    .line 23
    .line 24
    invoke-direct {v0, p0}, LX1/d;-><init>(LX1/e;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1, v0}, LX1/b$c;->a(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
