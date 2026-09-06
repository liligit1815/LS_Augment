.class public Lcom/android/launcher3/taskbar/q4;
.super Ljava/lang/Object;
.source "TaskbarUnfoldAnimationController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/q4$a;
    }
.end annotation


# instance fields
.field private final g:LF2/i;

.field private final h:LF2/f;

.field private final i:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

.field private final j:Lcom/android/launcher3/taskbar/q4$a;

.field private k:Lcom/android/launcher3/taskbar/W4;

.field private l:Lcom/android/launcher3/taskbar/s2;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/b;LF2/i;Landroid/view/WindowManager;LE2/c;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/taskbar/q4$a;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/taskbar/q4$a;-><init>(Lcom/android/launcher3/taskbar/q4;Lcom/android/launcher3/taskbar/r4;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/taskbar/q4;->j:Lcom/android/launcher3/taskbar/q4$a;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/android/launcher3/taskbar/q4;->g:LF2/i;

    .line 13
    .line 14
    new-instance v0, LF2/f;

    .line 15
    .line 16
    invoke-direct {v0, p1, p4, p2}, LF2/f;-><init>(Landroid/content/Context;LE2/c;LC2/i;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/taskbar/q4;->h:LF2/f;

    .line 20
    .line 21
    new-instance p1, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 22
    .line 23
    new-instance p2, Lcom/android/quickstep/util/LauncherViewsMoveFromCenterTranslationApplier;

    .line 24
    .line 25
    invoke-direct {p2}, Lcom/android/quickstep/util/LauncherViewsMoveFromCenterTranslationApplier;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-direct {p1, p3, p2}, Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;-><init>(Landroid/view/WindowManager;Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator$TranslationApplier;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/launcher3/taskbar/q4;->i:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/q4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/q4;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/taskbar/q4;)Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q4;->i:Lcom/android/systemui/shared/animation/UnfoldMoveFromCenterAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/taskbar/q4;)Lcom/android/launcher3/taskbar/s2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q4;->l:Lcom/android/launcher3/taskbar/s2;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/taskbar/q4;)Lcom/android/launcher3/taskbar/W4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q4;->k:Lcom/android/launcher3/taskbar/W4;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic g()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/q4;->g:LF2/i;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, LF2/i;->i(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, "TaskbarUnfoldAnimationController:"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public f(Lcom/android/launcher3/taskbar/R1;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4;->h:LF2/f;

    .line 2
    .line 3
    invoke-virtual {v0}, LF2/f;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/android/launcher3/taskbar/q4;->k:Lcom/android/launcher3/taskbar/W4;

    .line 9
    .line 10
    new-instance v1, Lcom/android/launcher3/taskbar/p4;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/p4;-><init>(Lcom/android/launcher3/taskbar/q4;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/W4;->u(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4;->h:LF2/f;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/taskbar/q4;->j:Lcom/android/launcher3/taskbar/q4$a;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, LF2/f;->b(LC2/i$a;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/launcher3/taskbar/q4;->l:Lcom/android/launcher3/taskbar/s2;

    .line 28
    .line 29
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4;->g:LF2/i;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, LF2/i;->i(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4;->h:LF2/f;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/q4;->j:Lcom/android/launcher3/taskbar/q4$a;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, LF2/f;->d(LC2/i$a;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/taskbar/q4;->h:LF2/f;

    .line 15
    .line 16
    invoke-virtual {v0}, LF2/f;->destroy()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/android/launcher3/taskbar/q4;->k:Lcom/android/launcher3/taskbar/W4;

    .line 21
    .line 22
    return-void
.end method
