.class public Lcom/android/launcher3/Workspace;
.super Lcom/android/launcher3/T6;
.source "Workspace.java"

# interfaces
.implements Lcom/android/launcher3/n0;
.implements Lcom/android/launcher3/m0;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/launcher3/S;
.implements Lcom/android/launcher3/dragndrop/j$b;
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/statemanager/d$f;
.implements Lcom/android/launcher3/M6;
.implements Lcom/android/launcher3/util/Y0;
.implements Lz2/a$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/Workspace$m;,
        Lcom/android/launcher3/Workspace$l;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ":",
        "Lcom/android/launcher3/pageindicators/d;",
        ">",
        "Lcom/android/launcher3/T6<",
        "TT;>;",
        "Lcom/android/launcher3/n0;",
        "Lcom/android/launcher3/m0;",
        "Landroid/view/View$OnTouchListener;",
        "Lcom/android/launcher3/S;",
        "Lcom/android/launcher3/dragndrop/j$b;",
        "Lcom/android/launcher3/g1;",
        "Lcom/android/launcher3/statemanager/d$f<",
        "Lcom/android/launcher3/V3;",
        ">;",
        "Lcom/android/launcher3/M6;",
        "Lcom/android/launcher3/util/Y0;",
        "Lz2/a$b;"
    }
.end annotation


# instance fields
.field private final A:[F

.field public A0:Z

.field private final B:Landroid/graphics/Rect;

.field public B0:Z

.field C:[F

.field private C0:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

.field private D:Lcom/android/launcher3/dragndrop/O;

.field private D0:F

.field private E:Z

.field private E0:Lcom/android/launcher3/CellLayout;

.field F:Z

.field private F0:I

.field private G:Z

.field public H:Z

.field private I:Z

.field final J:Lcom/android/launcher3/util/l3;

.field private K:Z

.field protected final L:Lcom/android/launcher3/c;

.field private M:Lcom/android/launcher3/folder/u0;

.field private N:Landroid/view/View;

.field private O:Lcom/android/launcher3/folder/FolderIcon;

.field public P:Z

.field private Q:Z

.field private R:F

.field private S:F

.field private T:Landroid/view/View;

.field private U:Z

.field protected V:I

.field W:I

.field a0:I

.field private b0:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;"
        }
    .end annotation
.end field

.field private final c0:Lcom/android/launcher3/util/x0;

.field private d0:F

.field private e0:F

.field private f0:Z

.field private g0:F

.field private final h0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lz2/a$b;",
            ">;"
        }
    .end annotation
.end field

.field private i0:Z

.field private final j:I

.field private final j0:Lcom/android/launcher3/N6;

.field private k:Landroid/animation/LayoutTransition;

.field private final k0:Lcom/android/launcher3/logging/StatsLogManager;

.field final l:Landroid/app/WallpaperManager;

.field private final l0:Lcom/android/launcher3/util/s1;

.field protected m:Lcom/android/launcher3/K5;

.field private final m0:Lcom/android/launcher3/statemanager/d$g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d$g<",
            "Lcom/android/launcher3/V3;",
            ">;"
        }
    .end annotation
.end field

.field public final n:Lcom/android/launcher3/util/A0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/CellLayout;",
            ">;"
        }
    .end annotation
.end field

.field private n0:Lcom/android/launcher3/dragndrop/j$b;

.field final o:Lcom/android/launcher3/util/x0;

.field o0:Lz2/a$a;

.field p:Z

.field public p0:Lp1/a;

.field protected q:Lc1/a;

.field public q0:Lp1/e;

.field r:[I

.field private r0:Z

.field private s:I

.field private s0:Ln1/d;

.field private t:I

.field private final t0:I

.field u:Lcom/android/launcher3/CellLayout;

.field u0:Z

.field private v:Lcom/android/launcher3/CellLayout;

.field private v0:Lcom/android/launcher3/touch/J;

.field private w:Lcom/android/launcher3/CellLayout;

.field private w0:Lcom/android/launcher3/globalsearch/r$b;

.field final x:Lcom/android/launcher3/C2;

.field private x0:Z

.field y:Lcom/android/launcher3/dragndrop/j;

.field private y0:Ly1/e;

.field protected final z:[I

.field private z0:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/Workspace;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/T6;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Lcom/android/launcher3/util/A0;

    invoke-direct {p2}, Lcom/android/launcher3/util/A0;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 4
    new-instance p2, Lcom/android/launcher3/util/x0;

    invoke-direct {p2}, Lcom/android/launcher3/util/x0;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->p:Z

    const/4 p3, 0x2

    .line 6
    new-array v0, p3, [I

    iput-object v0, p0, Lcom/android/launcher3/Workspace;->r:[I

    const/4 v0, -0x1

    .line 7
    iput v0, p0, Lcom/android/launcher3/Workspace;->s:I

    .line 8
    iput v0, p0, Lcom/android/launcher3/Workspace;->t:I

    const/4 v1, 0x0

    .line 9
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 10
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->v:Lcom/android/launcher3/CellLayout;

    .line 11
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->w:Lcom/android/launcher3/CellLayout;

    .line 12
    new-array v2, p3, [I

    iput-object v2, p0, Lcom/android/launcher3/Workspace;->z:[I

    .line 13
    new-array v2, p3, [F

    iput-object v2, p0, Lcom/android/launcher3/Workspace;->A:[F

    .line 14
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/launcher3/Workspace;->B:Landroid/graphics/Rect;

    .line 15
    new-array p3, p3, [F

    iput-object p3, p0, Lcom/android/launcher3/Workspace;->C:[F

    .line 16
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->E:Z

    const/4 p3, 0x1

    .line 17
    iput-boolean p3, p0, Lcom/android/launcher3/Workspace;->F:Z

    .line 18
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->G:Z

    .line 19
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->H:Z

    .line 20
    new-instance v2, Lcom/android/launcher3/c;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/android/launcher3/Workspace;->L:Lcom/android/launcher3/c;

    .line 21
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 22
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->O:Lcom/android/launcher3/folder/FolderIcon;

    .line 23
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->P:Z

    .line 24
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->Q:Z

    .line 25
    iput p2, p0, Lcom/android/launcher3/Workspace;->V:I

    .line 26
    iput v0, p0, Lcom/android/launcher3/Workspace;->W:I

    .line 27
    iput v0, p0, Lcom/android/launcher3/Workspace;->a0:I

    .line 28
    new-instance v3, Lcom/android/launcher3/util/x0;

    invoke-direct {v3}, Lcom/android/launcher3/util/x0;-><init>()V

    iput-object v3, p0, Lcom/android/launcher3/Workspace;->c0:Lcom/android/launcher3/util/x0;

    .line 29
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->f0:Z

    .line 30
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/launcher3/Workspace;->h0:Ljava/util/List;

    .line 31
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->i0:Z

    .line 32
    new-instance v3, Lcom/android/launcher3/Workspace$c;

    invoke-direct {v3, p0}, Lcom/android/launcher3/Workspace$c;-><init>(Lcom/android/launcher3/Workspace;)V

    iput-object v3, p0, Lcom/android/launcher3/Workspace;->m0:Lcom/android/launcher3/statemanager/d$g;

    .line 33
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->r0:Z

    .line 34
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 35
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->u0:Z

    .line 36
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->x0:Z

    .line 37
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->A0:Z

    .line 38
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->B0:Z

    .line 39
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 40
    iput v0, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 41
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 42
    new-instance v1, Lcom/android/launcher3/N6;

    invoke-direct {v1, v0, p0}, Lcom/android/launcher3/N6;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;)V

    iput-object v1, p0, Lcom/android/launcher3/Workspace;->j0:Lcom/android/launcher3/N6;

    .line 43
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher3/Workspace;->l:Landroid/app/WallpaperManager;

    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    iget v1, v1, Lcom/android/launcher3/h0;->J2:I

    iput v1, p0, Lcom/android/launcher3/Workspace;->j:I

    .line 45
    new-instance v1, Lcom/android/launcher3/util/l3;

    invoke-direct {v1, p0}, Lcom/android/launcher3/util/l3;-><init>(Lcom/android/launcher3/Workspace;)V

    iput-object v1, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 46
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setHapticFeedbackEnabled(Z)V

    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->u1()V

    .line 48
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 49
    new-instance v1, Lcom/android/launcher3/touch/J;

    invoke-direct {v1, v0, p0}, Lcom/android/launcher3/touch/J;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;)V

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 50
    invoke-static {p1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher3/Workspace;->k0:Lcom/android/launcher3/logging/StatsLogManager;

    .line 51
    sget-object v1, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher3/util/s1;

    iput-object v1, p0, Lcom/android/launcher3/Workspace;->l0:Lcom/android/launcher3/util/s1;

    .line 52
    new-instance v1, Lcom/android/launcher3/touch/J;

    invoke-direct {v1, v0, p0}, Lcom/android/launcher3/touch/J;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;)V

    iput-object v1, p0, Lcom/android/launcher3/Workspace;->v0:Lcom/android/launcher3/touch/J;

    .line 53
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 54
    sget-object v1, Lf1/a;->x:Lf1/a$a;

    invoke-virtual {v1}, Lf1/a$a;->c()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 55
    new-instance v1, Lp1/a;

    invoke-direct {v1, v0, v2}, Lp1/a;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/c;)V

    iput-object v1, p0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 56
    new-instance v1, Lp1/e;

    invoke-direct {v1, v0}, Lp1/e;-><init>(Lcom/android/launcher3/C2;)V

    iput-object v1, p0, Lcom/android/launcher3/Workspace;->q0:Lp1/e;

    .line 57
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object p1

    iget-boolean p1, p1, Lcom/android/launcher3/r4;->Y:Z

    if-nez p1, :cond_1

    invoke-static {}, Lm1/a;->a()Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    move p2, p3

    :cond_2
    iput-boolean p2, p0, Lcom/android/launcher3/Workspace;->r0:Z

    .line 58
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object p1

    iget-boolean p1, p1, Lcom/android/launcher3/r4;->M:Z

    if-eqz p1, :cond_3

    .line 59
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->s()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 60
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0702c3

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/Workspace;->t0:I

    goto :goto_0

    .line 61
    :cond_3
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0702c2

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/Workspace;->t0:I

    .line 62
    :goto_0
    new-instance p1, Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    invoke-direct {p1, p0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/android/launcher3/Workspace;->C0:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    return-void
.end method

.method private static A2(Landroid/view/View;)V
    .locals 3

    .line 1
    const v0, 0x7f0b046e

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    instance-of v2, v1, Ljava/lang/Integer;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    check-cast v1, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p0, v1, v2}, Landroid/view/View;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    check-cast p0, Landroid/view/ViewGroup;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-ge v0, v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Lcom/android/launcher3/Workspace;->A2(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void
.end method

.method private A3()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_4

    .line 10
    .line 11
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 12
    .line 13
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 14
    .line 15
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    if-nez v3, :cond_1

    .line 24
    .line 25
    new-instance v3, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v4, "updateWorkspaceWidgetsSizes null error, i="

    .line 31
    .line 32
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 36
    .line 37
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v4, " mScreenOrder="

    .line 45
    .line 46
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v5, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 50
    .line 51
    invoke-virtual {v5, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v5, " mWorkspaceScreens="

    .line 59
    .line 60
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-object v6, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 64
    .line 65
    iget-object v7, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 66
    .line 67
    invoke-virtual {v7, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    invoke-virtual {v6, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    if-eqz v6, :cond_0

    .line 76
    .line 77
    const/4 v6, 0x1

    .line 78
    goto :goto_1

    .line 79
    :cond_0
    move v6, v1

    .line 80
    :goto_1
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 87
    .line 88
    invoke-virtual {v4}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 99
    .line 100
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v4, " "

    .line 104
    .line 105
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    new-instance v4, Ljava/lang/Throwable;

    .line 109
    .line 110
    invoke-direct {v4}, Ljava/lang/Throwable;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    const-string v4, "Launcher.Workspace"

    .line 125
    .line 126
    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 131
    .line 132
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 133
    .line 134
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 143
    .line 144
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    move v5, v1

    .line 153
    :goto_2
    if-ge v5, v4, :cond_3

    .line 154
    .line 155
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    instance-of v7, v6, Lcom/android/launcher3/widget/T;

    .line 160
    .line 161
    if-eqz v7, :cond_2

    .line 162
    .line 163
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v7

    .line 167
    instance-of v7, v7, Lcom/android/launcher3/model/data/A;

    .line 168
    .line 169
    if-eqz v7, :cond_2

    .line 170
    .line 171
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    check-cast v7, Lcom/android/launcher3/model/data/A;

    .line 176
    .line 177
    check-cast v6, Lcom/android/launcher3/widget/T;

    .line 178
    .line 179
    iget-object v8, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 180
    .line 181
    iget v9, v7, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 182
    .line 183
    iget v7, v7, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 184
    .line 185
    invoke-static {v6, v8, v9, v7}, Lr2/b;->i(Landroid/appwidget/AppWidgetHostView;Landroid/content/Context;II)V

    .line 186
    .line 187
    .line 188
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_3
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :cond_4
    return-void
.end method

.method private B1(Lcom/android/launcher3/n0$a;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->T:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->B:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/Workspace;->m1(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->B:Landroid/graphics/Rect;

    .line 13
    .line 14
    iget v0, p1, Lcom/android/launcher3/n0$a;->a:I

    .line 15
    .line 16
    iget p1, p1, Lcom/android/launcher3/n0$a;->b:I

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method private B3(IFF)Lcom/android/launcher3/CellLayout;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aput p2, v0, v1

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    aput p3, v0, p2

    .line 9
    .line 10
    const/4 p3, 0x0

    .line 11
    const/4 v2, 0x0

    .line 12
    if-ltz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-ge p1, v3, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/Workspace;->o2(Landroid/view/View;[F)V

    .line 27
    .line 28
    .line 29
    aget p0, v0, v1

    .line 30
    .line 31
    cmpl-float v1, p0, v2

    .line 32
    .line 33
    if-ltz v1, :cond_6

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v1, v1

    .line 40
    cmpg-float p0, p0, v1

    .line 41
    .line 42
    if-gtz p0, :cond_6

    .line 43
    .line 44
    aget p0, v0, p2

    .line 45
    .line 46
    cmpl-float p2, p0, v2

    .line 47
    .line 48
    if-ltz p2, :cond_6

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    int-to-float p2, p2

    .line 55
    cmpg-float p0, p0, p2

    .line 56
    .line 57
    if-gtz p0, :cond_6

    .line 58
    .line 59
    return-object p1

    .line 60
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isCircle()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-ne p1, v3, :cond_1

    .line 71
    .line 72
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 77
    .line 78
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/Workspace;->p2(I[F)V

    .line 79
    .line 80
    .line 81
    aget p0, v0, v1

    .line 82
    .line 83
    cmpl-float p1, p0, v2

    .line 84
    .line 85
    if-ltz p1, :cond_6

    .line 86
    .line 87
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getWidth()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    int-to-float p1, p1

    .line 92
    cmpg-float p0, p0, p1

    .line 93
    .line 94
    if-gtz p0, :cond_6

    .line 95
    .line 96
    aget p0, v0, p2

    .line 97
    .line 98
    cmpl-float p1, p0, v2

    .line 99
    .line 100
    if-ltz p1, :cond_6

    .line 101
    .line 102
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getHeight()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    int-to-float p1, p1

    .line 107
    cmpg-float p0, p0, p1

    .line 108
    .line 109
    if-gtz p0, :cond_6

    .line 110
    .line 111
    return-object v3

    .line 112
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isCircle()Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-eqz v3, :cond_6

    .line 117
    .line 118
    const/4 v3, -0x1

    .line 119
    if-ne p1, v3, :cond_6

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    sub-int/2addr v3, p2

    .line 126
    invoke-virtual {p0, v3}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 131
    .line 132
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    if-eqz v4, :cond_5

    .line 137
    .line 138
    aget v4, v0, v1

    .line 139
    .line 140
    cmpl-float v5, v4, v2

    .line 141
    .line 142
    if-ltz v5, :cond_2

    .line 143
    .line 144
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getWidth()I

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    int-to-float v5, v5

    .line 149
    cmpg-float v4, v4, v5

    .line 150
    .line 151
    if-gtz v4, :cond_2

    .line 152
    .line 153
    return-object p3

    .line 154
    :cond_2
    aget v4, v0, v1

    .line 155
    .line 156
    cmpg-float v4, v4, v2

    .line 157
    .line 158
    if-gez v4, :cond_5

    .line 159
    .line 160
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 171
    .line 172
    if-ne p0, p1, :cond_4

    .line 173
    .line 174
    aget p0, v0, p2

    .line 175
    .line 176
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getTop()I

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    int-to-float p1, p1

    .line 181
    cmpg-float p0, p0, p1

    .line 182
    .line 183
    if-ltz p0, :cond_3

    .line 184
    .line 185
    aget p0, v0, p2

    .line 186
    .line 187
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getTop()I

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getHeight()I

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    add-int/2addr p1, p2

    .line 196
    int-to-float p1, p1

    .line 197
    cmpl-float p0, p0, p1

    .line 198
    .line 199
    if-lez p0, :cond_4

    .line 200
    .line 201
    :cond_3
    return-object p3

    .line 202
    :cond_4
    return-object v3

    .line 203
    :cond_5
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/Workspace;->p2(I[F)V

    .line 204
    .line 205
    .line 206
    aget p0, v0, v1

    .line 207
    .line 208
    cmpl-float p1, p0, v2

    .line 209
    .line 210
    if-ltz p1, :cond_6

    .line 211
    .line 212
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getWidth()I

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    int-to-float p1, p1

    .line 217
    cmpg-float p0, p0, p1

    .line 218
    .line 219
    if-gtz p0, :cond_6

    .line 220
    .line 221
    aget p0, v0, p2

    .line 222
    .line 223
    cmpl-float p1, p0, v2

    .line 224
    .line 225
    if-ltz p1, :cond_6

    .line 226
    .line 227
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getHeight()I

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    int-to-float p1, p1

    .line 232
    cmpg-float p0, p0, p1

    .line 233
    .line 234
    if-gtz p0, :cond_6

    .line 235
    .line 236
    return-object v3

    .line 237
    :cond_6
    return-object p3
.end method

.method private C1(Lcom/android/launcher3/n0$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    instance-of p1, p0, Lcom/android/launcher3/model/data/A;

    .line 4
    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    instance-of p0, p0, Lcom/android/launcher3/widget/z0;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method private D1(FF)Z
    .locals 2

    .line 1
    sub-float/2addr p1, p2

    .line 2
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    float-to-double p0, p0

    .line 7
    const-wide v0, 0x3e7ad7f29abcaf48L    # 1.0E-7

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmpg-double p0, p0, v0

    .line 13
    .line 14
    if-gez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method private H0(Lcom/android/launcher3/n0$a;F)Lcom/android/launcher3/CellLayout;
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageInTransition()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    iget v0, p1, Lcom/android/launcher3/n0$a;->b:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    add-int/lit8 v3, v2, -0x1

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J1()Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/4 v5, 0x2

    .line 23
    if-eqz v4, :cond_1

    .line 24
    .line 25
    move v4, v5

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v4, 0x1

    .line 28
    :goto_0
    add-int/2addr v4, v2

    .line 29
    filled-new-array {v3, v4}, [I

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-static {v3}, Lcom/android/launcher3/util/z0;->wrap([I)Lcom/android/launcher3/util/z0;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v3}, Lcom/android/launcher3/util/z0;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_a

    .line 46
    .line 47
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-eqz v6, :cond_6

    .line 62
    .line 63
    const/high16 v6, 0x40800000    # 4.0f

    .line 64
    .line 65
    if-ge v4, v2, :cond_3

    .line 66
    .line 67
    iget-boolean v7, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 68
    .line 69
    if-eqz v7, :cond_4

    .line 70
    .line 71
    :cond_3
    if-le v4, v2, :cond_5

    .line 72
    .line 73
    iget-boolean v7, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 74
    .line 75
    if-eqz v7, :cond_5

    .line 76
    .line 77
    :cond_4
    iget-object v7, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 78
    .line 79
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getWidth()I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    int-to-float v7, v7

    .line 84
    div-float/2addr v7, v6

    .line 85
    sub-float v6, p2, v7

    .line 86
    .line 87
    iget v7, p1, Lcom/android/launcher3/n0$a;->a:I

    .line 88
    .line 89
    int-to-float v7, v7

    .line 90
    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    :goto_1
    int-to-float v7, v7

    .line 99
    sub-float/2addr v6, v7

    .line 100
    goto :goto_3

    .line 101
    :cond_5
    iget-object v7, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 102
    .line 103
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getWidth()I

    .line 104
    .line 105
    .line 106
    move-result v7

    .line 107
    int-to-float v7, v7

    .line 108
    div-float/2addr v7, v6

    .line 109
    add-float/2addr v7, p2

    .line 110
    iget v6, p1, Lcom/android/launcher3/n0$a;->a:I

    .line 111
    .line 112
    int-to-float v6, v6

    .line 113
    invoke-static {v7, v6}, Ljava/lang/Math;->max(FF)F

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    :goto_2
    int-to-float v7, v7

    .line 122
    add-float/2addr v6, v7

    .line 123
    goto :goto_3

    .line 124
    :cond_6
    if-ge v4, v2, :cond_7

    .line 125
    .line 126
    iget-boolean v6, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 127
    .line 128
    if-eqz v6, :cond_8

    .line 129
    .line 130
    :cond_7
    if-le v4, v2, :cond_9

    .line 131
    .line 132
    iget-boolean v6, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 133
    .line 134
    if-eqz v6, :cond_9

    .line 135
    .line 136
    :cond_8
    iget v6, p1, Lcom/android/launcher3/n0$a;->a:I

    .line 137
    .line 138
    int-to-float v6, v6

    .line 139
    invoke-static {p2, v6}, Ljava/lang/Math;->min(FF)F

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 144
    .line 145
    .line 146
    move-result v7

    .line 147
    mul-int/2addr v7, v5

    .line 148
    int-to-float v7, v7

    .line 149
    sub-float/2addr v6, v7

    .line 150
    iget v7, p0, Lcom/android/launcher3/Workspace;->t0:I

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_9
    iget v6, p1, Lcom/android/launcher3/n0$a;->a:I

    .line 154
    .line 155
    int-to-float v6, v6

    .line 156
    invoke-static {p2, v6}, Ljava/lang/Math;->max(FF)F

    .line 157
    .line 158
    .line 159
    move-result v6

    .line 160
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    mul-int/2addr v7, v5

    .line 165
    int-to-float v7, v7

    .line 166
    add-float/2addr v6, v7

    .line 167
    iget v7, p0, Lcom/android/launcher3/Workspace;->t0:I

    .line 168
    .line 169
    goto :goto_2

    .line 170
    :goto_3
    invoke-direct {p0, v4, v6, v0}, Lcom/android/launcher3/Workspace;->B3(IFF)Lcom/android/launcher3/CellLayout;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    if-eqz v4, :cond_2

    .line 175
    .line 176
    return-object v4

    .line 177
    :cond_a
    return-object v1
.end method

.method private I0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->O:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->X()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->O:Lcom/android/launcher3/folder/FolderIcon;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private I3()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method private J1()Z
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->c:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private J3()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->q:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    sget-object v1, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I3()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method private synthetic K1(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->w1(I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v0, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/menu/c;->a()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method private synthetic L1(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->w1(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private synthetic M1(Lcom/android/launcher3/util/z0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-direct {p0, p2}, Lcom/android/launcher3/Workspace;->N0(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private N0(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 14
    .line 15
    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 19
    .line 20
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Lz1/k2;->F()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 44
    .line 45
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    add-int/lit8 p1, p1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 55
    .line 56
    invoke-virtual {v2, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 60
    .line 61
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 65
    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->getMfvPageIndicatorMarker(I)Lcom/android/launcher3/pageindicators/b;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->v(ILcom/android/launcher3/pageindicators/b;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return p1
.end method

.method private synthetic N1(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/widget/T;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageInTransition()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x2

    .line 19
    new-array p0, p0, [I

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget v0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 24
    .line 25
    iget p1, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 26
    .line 27
    invoke-virtual {p2, v0, p1, p0}, Lcom/android/launcher3/CellLayout;->p(II[I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-virtual {p3, p0}, Lcom/android/launcher3/widget/T;->setDelta([I)V

    .line 31
    .line 32
    .line 33
    invoke-static {p3, p2}, Lcom/android/launcher3/AppWidgetResizeFrame;->n0(Lcom/android/launcher3/widget/T;Lcom/android/launcher3/CellLayout;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method private synthetic O1(Lcom/android/launcher3/CellLayout;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method private synthetic P1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->F2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/Workspace;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->P1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Q0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->c3()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getPanelCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->r1()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_6

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/util/x0;->size()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ge v1, v0, :cond_1

    .line 28
    .line 29
    goto/16 :goto_3

    .line 30
    .line 31
    :cond_1
    new-instance v1, Landroid/util/SparseArray;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/android/launcher3/util/x0;->size()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    sub-int v0, v2, v0

    .line 43
    .line 44
    :goto_0
    if-ge v0, v2, :cond_3

    .line 45
    .line 46
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 47
    .line 48
    invoke-virtual {v3, v0}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 53
    .line 54
    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Lcom/android/launcher3/CellLayout;

    .line 59
    .line 60
    if-eqz v4, :cond_6

    .line 61
    .line 62
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    if-nez v5, :cond_6

    .line 71
    .line 72
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->X()Z

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-eqz v5, :cond_2

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_2
    invoke-virtual {v1, v3, v4}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    const/4 v0, 0x0

    .line 86
    :goto_1
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-ge v0, v2, :cond_6

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-static {}, Lcom/android/launcher3/y0;->Z()Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    if-eqz v3, :cond_4

    .line 101
    .line 102
    if-nez v2, :cond_4

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_4
    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 110
    .line 111
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 112
    .line 113
    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->remove(I)V

    .line 114
    .line 115
    .line 116
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 117
    .line 118
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 119
    .line 120
    .line 121
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 122
    .line 123
    const/16 v4, -0xc9

    .line 124
    .line 125
    invoke-virtual {v2, v4}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-eqz v2, :cond_5

    .line 130
    .line 131
    const/16 v4, -0xc8

    .line 132
    .line 133
    :cond_5
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 134
    .line 135
    invoke-virtual {v2, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 139
    .line 140
    invoke-virtual {v2, v4}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 141
    .line 142
    .line 143
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_6
    :goto_3
    return-void
.end method

.method private synthetic Q1(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageInTransition()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x2

    .line 19
    new-array p0, p0, [I

    .line 20
    .line 21
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 22
    .line 23
    iget p2, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 24
    .line 25
    invoke-virtual {p1, v0, p2, p0}, Lcom/android/launcher3/CellLayout;->p(II[I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic R(Lcom/android/launcher3/Workspace;Ljava/util/List;ZLcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/Workspace;->X1(Ljava/util/List;ZLcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic R1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->A0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic S(Lcom/android/launcher3/Workspace;Landroid/graphics/Rect;Lcom/android/launcher3/CellLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/Workspace;->W1(Landroid/graphics/Rect;Lcom/android/launcher3/CellLayout;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private S0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->Z0(Lcom/android/launcher3/model/data/y;)[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    aget v0, p0, p1

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const v2, 0x7fffffff

    .line 10
    .line 11
    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    aget v0, p0, v1

    .line 15
    .line 16
    if-ne v0, v2, :cond_1

    .line 17
    .line 18
    :cond_0
    const/16 v0, 0xa

    .line 19
    .line 20
    aput v0, p0, p1

    .line 21
    .line 22
    aput v0, p0, v1

    .line 23
    .line 24
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    aget v2, p0, p1

    .line 32
    .line 33
    const/high16 v3, 0x40000000    # 2.0f

    .line 34
    .line 35
    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    aget v4, p0, v1

    .line 40
    .line 41
    invoke-static {v4, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-virtual {p2, v2, v3}, Landroid/view/View;->measure(II)V

    .line 46
    .line 47
    .line 48
    aget v2, p0, p1

    .line 49
    .line 50
    aget v3, p0, v1

    .line 51
    .line 52
    invoke-virtual {p2, p1, p1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 53
    .line 54
    .line 55
    aget p1, p0, p1

    .line 56
    .line 57
    aget p0, p0, v1

    .line 58
    .line 59
    new-instance v1, Lcom/android/launcher3/q6;

    .line 60
    .line 61
    invoke-direct {v1, p2}, Lcom/android/launcher3/q6;-><init>(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, p0, v1}, Ls1/e;->a(IILs1/e;)Landroid/graphics/Bitmap;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    new-instance p1, Ls1/o;

    .line 72
    .line 73
    invoke-direct {p1, p0}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 74
    .line 75
    .line 76
    return-object p1
.end method

.method private synthetic S1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->A0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic T(Lcom/android/launcher3/Workspace;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->S1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic T1(ZLjava/lang/Runnable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/launcher3/Workspace;->G2(IZLjava/lang/Runnable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic U(Lcom/android/launcher3/Workspace;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->R1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic U1(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->removeView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private U2(Lcom/android/launcher3/n0$a;FFZ)Z
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->d3(Lcom/android/launcher3/n0$a;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p3, :cond_1

    .line 7
    .line 8
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iget-object p3, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    sget-object p4, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    invoke-interface {p3, p4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    if-eqz p3, :cond_6

    .line 23
    .line 24
    :cond_0
    move-object p2, v0

    .line 25
    goto :goto_2

    .line 26
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->B1(Lcom/android/launcher3/n0$a;)Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-nez p3, :cond_0

    .line 31
    .line 32
    if-nez p4, :cond_2

    .line 33
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/Workspace;->H0(Lcom/android/launcher3/n0$a;F)Lcom/android/launcher3/CellLayout;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    goto :goto_0

    .line 39
    :cond_2
    move-object p2, v0

    .line 40
    :goto_0
    if-nez p2, :cond_4

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getVisiblePageIndices()Lcom/android/launcher3/util/z0;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p3}, Lcom/android/launcher3/util/z0;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    :cond_3
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result p4

    .line 54
    if-eqz p4, :cond_4

    .line 55
    .line 56
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    check-cast p2, Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    iget p4, p1, Lcom/android/launcher3/n0$a;->a:I

    .line 67
    .line 68
    int-to-float p4, p4

    .line 69
    iget v1, p1, Lcom/android/launcher3/n0$a;->b:I

    .line 70
    .line 71
    int-to-float v1, v1

    .line 72
    invoke-direct {p0, p2, p4, v1}, Lcom/android/launcher3/Workspace;->B3(IFF)Lcom/android/launcher3/CellLayout;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    if-eqz p2, :cond_3

    .line 77
    .line 78
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isCircle()Z

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    if-eqz p3, :cond_5

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    invoke-virtual {p0, p3}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    .line 89
    .line 90
    .line 91
    move-result p3

    .line 92
    goto :goto_1

    .line 93
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 94
    .line 95
    .line 96
    move-result p3

    .line 97
    invoke-virtual {p0, p3}, Lcom/android/launcher3/V4;->validPageIndex(I)I

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    :goto_1
    if-nez p2, :cond_6

    .line 102
    .line 103
    if-ltz p3, :cond_6

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 106
    .line 107
    .line 108
    move-result p4

    .line 109
    if-ge p3, p4, :cond_6

    .line 110
    .line 111
    invoke-virtual {p0, p3}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    check-cast p2, Lcom/android/launcher3/CellLayout;

    .line 116
    .line 117
    :cond_6
    :goto_2
    iget-object p3, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 118
    .line 119
    if-eq p2, p3, :cond_b

    .line 120
    .line 121
    sget-object p3, Lf1/a;->x:Lf1/a$a;

    .line 122
    .line 123
    invoke-virtual {p3}, Lf1/a$a;->c()Z

    .line 124
    .line 125
    .line 126
    move-result p3

    .line 127
    if-eqz p3, :cond_9

    .line 128
    .line 129
    iget-object p3, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 130
    .line 131
    sget-object p4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 132
    .line 133
    invoke-interface {p3, p4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    if-nez p3, :cond_7

    .line 138
    .line 139
    iget-object p3, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 140
    .line 141
    sget-object p4, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 142
    .line 143
    invoke-interface {p3, p4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 144
    .line 145
    .line 146
    move-result p3

    .line 147
    if-eqz p3, :cond_9

    .line 148
    .line 149
    :cond_7
    iget-object p3, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 150
    .line 151
    if-nez p3, :cond_8

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_8
    iget-object v0, p3, Lc1/a;->e:Landroid/view/View;

    .line 155
    .line 156
    :goto_3
    iget-object p3, p0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 157
    .line 158
    iget-object p4, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 159
    .line 160
    invoke-virtual {p3, p4, p2, p1, v0}, Lp1/a;->b(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/n0$a;Landroid/view/View;)V

    .line 161
    .line 162
    .line 163
    :cond_9
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 164
    .line 165
    iget-object p3, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 166
    .line 167
    invoke-static {p1, p3}, Lp1/f;->v(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_a

    .line 172
    .line 173
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 174
    .line 175
    invoke-static {p1, p2}, Lp1/f;->v(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-nez p1, :cond_a

    .line 180
    .line 181
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->q0:Lp1/e;

    .line 182
    .line 183
    if-eqz p1, :cond_a

    .line 184
    .line 185
    invoke-virtual {p1}, Lp1/e;->f()V

    .line 186
    .line 187
    .line 188
    :cond_a
    invoke-virtual {p0, p2}, Lcom/android/launcher3/Workspace;->setCurrentDropLayout(Lcom/android/launcher3/CellLayout;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, p2}, Lcom/android/launcher3/Workspace;->setCurrentDragOverlappingLayout(Lcom/android/launcher3/CellLayout;)V

    .line 192
    .line 193
    .line 194
    const/4 p0, 0x1

    .line 195
    return p0

    .line 196
    :cond_b
    const/4 p0, 0x0

    .line 197
    return p0
.end method

.method public static synthetic V(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/Workspace;->Q1(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic V1(ILcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 3

    .line 1
    instance-of v0, p2, Lcom/android/launcher3/model/data/A;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    check-cast p2, Lcom/android/launcher3/model/data/A;

    .line 6
    .line 7
    iget v0, p2, Lcom/android/launcher3/model/data/A;->g:I

    .line 8
    .line 9
    if-ne v0, p1, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    const-string v1, "widget is removed in response to widget remove broadcast"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, p3, p2, v2, v1}, Lcom/android/launcher3/C2;->o4(Landroid/view/View;Lcom/android/launcher3/model/data/y;ZLjava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    const-string v0, "Launcher.Workspace"

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    new-instance p2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "removeWidget AIFutureWidgetUtils appWidgetId="

    .line 33
    .line 34
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-static {p2, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->M(Landroid/content/Context;I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    new-instance p2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v1, "removeWidget appWidgetId="

    .line 66
    .line 67
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-static {p2, p1}, Lcom/android/launcher3/widget/suggest/g;->g(Landroid/content/Context;I)V

    .line 85
    .line 86
    .line 87
    instance-of p2, p3, Lcom/android/launcher3/widget/suggest/m;

    .line 88
    .line 89
    if-eqz p2, :cond_1

    .line 90
    .line 91
    new-instance p2, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v1, " hostView="

    .line 103
    .line 104
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    check-cast p3, Lcom/android/launcher3/widget/suggest/m;

    .line 108
    .line 109
    invoke-virtual {p3}, Lcom/android/launcher3/widget/suggest/m;->getSuggestWidgetHostViewTag()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 124
    .line 125
    invoke-static {p2, p1, p3}, Lcom/android/launcher3/widget/suggest/v;->H(Lcom/android/launcher3/C2;ILcom/android/launcher3/widget/T;)V

    .line 126
    .line 127
    .line 128
    :cond_1
    invoke-static {}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->l()Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    if-eqz p2, :cond_2

    .line 133
    .line 134
    new-instance p2, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .line 138
    .line 139
    const-string p3, "removeWidget GroupWidgetUtils appWidgetId="

    .line 140
    .line 141
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->n(Landroid/content/Context;I)V

    .line 159
    .line 160
    .line 161
    :cond_2
    return v2

    .line 162
    :cond_3
    const/4 p0, 0x0

    .line 163
    return p0
.end method

.method public static synthetic W(Lcom/android/launcher3/Workspace;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->U1(Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private W0(ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {v0, v1, p0, p1, p2}, Lcom/android/launcher3/W3;->f(Lcom/android/launcher3/C2;IZZ)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic W1(Landroid/graphics/Rect;Lcom/android/launcher3/CellLayout;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 4
    .line 5
    iget v2, p1, Landroid/graphics/Rect;->right:I

    .line 6
    .line 7
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 8
    .line 9
    invoke-virtual {p2, v0, v1, v2, p1}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageSpacing()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    div-int/lit8 p0, p0, 0x4

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Lcom/android/launcher3/CellLayout;->setSpaceBetweenCellLayoutsPx(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private W2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 14
    .line 15
    iget-object v2, v0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    iget v0, v0, Lcom/android/launcher3/h0;->J1:I

    .line 26
    .line 27
    add-int/2addr v3, v0

    .line 28
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 29
    .line 30
    iget v3, v2, Landroid/graphics/Rect;->right:I

    .line 31
    .line 32
    add-int/2addr v3, v0

    .line 33
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 34
    .line 35
    iget v0, v2, Landroid/graphics/Rect;->bottom:I

    .line 36
    .line 37
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v2, 0x0

    .line 41
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 42
    .line 43
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 44
    .line 45
    const/16 v2, 0x51

    .line 46
    .line 47
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 48
    .line 49
    iget v0, v0, Lcom/android/launcher3/h0;->f2:I

    .line 50
    .line 51
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 52
    .line 53
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static synthetic X(Ljava/util/List;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    iput-boolean p0, p1, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 10
    .line 11
    return-void
.end method

.method private X0()V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->F:Z

    .line 2
    .line 3
    if-eqz v0, :cond_a

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getVisibleChildrenRange()[I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    aget v3, v1, v2

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    aget v1, v1, v4

    .line 18
    .line 19
    iget-boolean v5, p0, Lcom/android/launcher3/Workspace;->i0:Z

    .line 20
    .line 21
    if-eqz v5, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    sub-int/2addr v3, v4

    .line 28
    invoke-static {v3, v2, v1}, Lcom/android/launcher3/N5;->c(III)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    add-int/2addr v1, v4

    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    sub-int/2addr v5, v4

    .line 42
    invoke-static {v1, v3, v5}, Lcom/android/launcher3/N5;->c(III)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    :cond_0
    if-ne v3, v1, :cond_2

    .line 47
    .line 48
    add-int/lit8 v5, v0, -0x1

    .line 49
    .line 50
    if-ge v1, v5, :cond_1

    .line 51
    .line 52
    add-int/lit8 v5, v1, 0x1

    .line 53
    .line 54
    move v6, v5

    .line 55
    :goto_0
    move v5, v3

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    if-lez v3, :cond_2

    .line 58
    .line 59
    add-int/lit8 v5, v3, -0x1

    .line 60
    .line 61
    move v6, v1

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    move v6, v1

    .line 64
    goto :goto_0

    .line 65
    :goto_1
    move v7, v2

    .line 66
    :goto_2
    if-ge v7, v0, :cond_4

    .line 67
    .line 68
    invoke-virtual {p0, v7}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    check-cast v8, Lcom/android/launcher3/CellLayout;

    .line 73
    .line 74
    if-gt v5, v7, :cond_3

    .line 75
    .line 76
    if-gt v7, v6, :cond_3

    .line 77
    .line 78
    move v9, v4

    .line 79
    goto :goto_3

    .line 80
    :cond_3
    move v9, v2

    .line 81
    :goto_3
    invoke-virtual {v8, v9}, Lcom/android/launcher3/CellLayout;->D(Z)V

    .line 82
    .line 83
    .line 84
    add-int/lit8 v7, v7, 0x1

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_4
    if-le v0, v4, :cond_a

    .line 88
    .line 89
    if-ne v3, v1, :cond_6

    .line 90
    .line 91
    add-int/lit8 v5, v0, -0x1

    .line 92
    .line 93
    if-ne v3, v5, :cond_6

    .line 94
    .line 95
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_5

    .line 106
    .line 107
    move v2, v4

    .line 108
    :cond_5
    invoke-virtual {p0, v2}, Lcom/android/launcher3/CellLayout;->D(Z)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_6
    const/4 v5, -0x1

    .line 113
    if-ne v3, v1, :cond_7

    .line 114
    .line 115
    if-eqz v3, :cond_8

    .line 116
    .line 117
    if-eq v3, v5, :cond_8

    .line 118
    .line 119
    add-int/lit8 v6, v0, -0x1

    .line 120
    .line 121
    if-eq v3, v6, :cond_8

    .line 122
    .line 123
    :cond_7
    if-ne v3, v5, :cond_a

    .line 124
    .line 125
    if-nez v1, :cond_a

    .line 126
    .line 127
    :cond_8
    sub-int/2addr v0, v4

    .line 128
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_9

    .line 139
    .line 140
    move v2, v4

    .line 141
    :cond_9
    invoke-virtual {p0, v2}, Lcom/android/launcher3/CellLayout;->D(Z)V

    .line 142
    .line 143
    .line 144
    :cond_a
    return-void
.end method

.method private synthetic X1(Ljava/util/List;ZLcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 2

    .line 1
    instance-of v0, p3, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p4, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_5

    .line 18
    .line 19
    check-cast p4, Lcom/android/launcher3/BubbleTextView;

    .line 20
    .line 21
    invoke-virtual {p4, p2}, Lcom/android/launcher3/BubbleTextView;->C(Z)V

    .line 22
    .line 23
    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_0
    instance-of v0, p3, Lcom/android/launcher3/model/data/p;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    instance-of v1, p4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    check-cast p4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 35
    .line 36
    invoke-virtual {p4}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllModeChildBubbleTextViewList()Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    if-eqz p3, :cond_5

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    check-cast p3, Landroid/view/View;

    .line 55
    .line 56
    instance-of p4, p3, Lcom/android/launcher3/BubbleTextView;

    .line 57
    .line 58
    if-eqz p4, :cond_1

    .line 59
    .line 60
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    if-eqz p4, :cond_1

    .line 65
    .line 66
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p4

    .line 70
    instance-of p4, p4, Lcom/android/launcher3/model/data/y;

    .line 71
    .line 72
    if-eqz p4, :cond_1

    .line 73
    .line 74
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p4

    .line 78
    check-cast p4, Lcom/android/launcher3/model/data/y;

    .line 79
    .line 80
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p4

    .line 84
    invoke-interface {p1, p4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p4

    .line 88
    if-eqz p4, :cond_1

    .line 89
    .line 90
    check-cast p3, Lcom/android/launcher3/BubbleTextView;

    .line 91
    .line 92
    invoke-virtual {p3, p2}, Lcom/android/launcher3/BubbleTextView;->C(Z)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    if-eqz v0, :cond_3

    .line 97
    .line 98
    instance-of v0, p4, Lcom/android/launcher3/folder/FolderIcon;

    .line 99
    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    check-cast p3, Lcom/android/launcher3/model/data/p;

    .line 103
    .line 104
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    new-instance v0, Lcom/android/launcher3/v6;

    .line 113
    .line 114
    invoke-direct {v0, p1}, Lcom/android/launcher3/v6;-><init>(Ljava/util/List;)V

    .line 115
    .line 116
    .line 117
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_5

    .line 122
    .line 123
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    new-instance p3, Lcom/android/launcher3/w6;

    .line 132
    .line 133
    invoke-direct {p3, p1}, Lcom/android/launcher3/w6;-><init>(Ljava/util/List;)V

    .line 134
    .line 135
    .line 136
    invoke-interface {p0, p3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    new-instance p1, Lcom/android/launcher3/x6;

    .line 141
    .line 142
    invoke-direct {p1, p2}, Lcom/android/launcher3/x6;-><init>(Z)V

    .line 143
    .line 144
    .line 145
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p4}, Landroid/view/View;->invalidate()V

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_3
    instance-of p3, p3, Lcom/android/launcher3/model/data/A;

    .line 153
    .line 154
    if-eqz p3, :cond_5

    .line 155
    .line 156
    instance-of p3, p4, Lcom/android/launcher3/widget/suggest/m;

    .line 157
    .line 158
    if-eqz p3, :cond_5

    .line 159
    .line 160
    new-instance p3, Ljava/util/ArrayList;

    .line 161
    .line 162
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .line 164
    .line 165
    check-cast p4, Lcom/android/launcher3/widget/suggest/m;

    .line 166
    .line 167
    invoke-virtual {p4, p0, p3}, Lcom/android/launcher3/widget/suggest/m;->u0(Landroid/view/View;Ljava/util/ArrayList;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    :cond_4
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 175
    .line 176
    .line 177
    move-result p3

    .line 178
    if-eqz p3, :cond_5

    .line 179
    .line 180
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p3

    .line 184
    check-cast p3, Lcom/android/launcher3/widget/suggest/e;

    .line 185
    .line 186
    move-object p4, p3

    .line 187
    check-cast p4, Landroid/view/View;

    .line 188
    .line 189
    invoke-virtual {p4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p4

    .line 193
    check-cast p4, Lcom/android/launcher3/model/data/y;

    .line 194
    .line 195
    instance-of v0, p3, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 196
    .line 197
    if-eqz v0, :cond_4

    .line 198
    .line 199
    if-eqz p4, :cond_4

    .line 200
    .line 201
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p4

    .line 205
    invoke-interface {p1, p4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p4

    .line 209
    if-eqz p4, :cond_4

    .line 210
    .line 211
    check-cast p3, Lcom/android/launcher3/BubbleTextView;

    .line 212
    .line 213
    invoke-virtual {p3, p2}, Lcom/android/launcher3/BubbleTextView;->C(Z)V

    .line 214
    .line 215
    .line 216
    goto :goto_1

    .line 217
    :cond_5
    :goto_2
    const/4 p0, 0x0

    .line 218
    return p0
.end method

.method public static synthetic Y(Lcom/android/launcher3/Workspace;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->L1(Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Y1(Ljava/util/List;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 2

    .line 1
    instance-of v0, p2, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p3, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p3, Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {p3, p0}, Lcom/android/launcher3/BubbleTextView;->F(Z)V

    .line 20
    .line 21
    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :cond_0
    instance-of v0, p2, Lcom/android/launcher3/model/data/p;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    instance-of v1, p3, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    check-cast p3, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 33
    .line 34
    invoke-virtual {p3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllModeChildBubbleTextViewList()Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_5

    .line 47
    .line 48
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Landroid/view/View;

    .line 53
    .line 54
    instance-of p3, p2, Lcom/android/launcher3/BubbleTextView;

    .line 55
    .line 56
    if-eqz p3, :cond_1

    .line 57
    .line 58
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    if-eqz p3, :cond_1

    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    instance-of p3, p3, Lcom/android/launcher3/model/data/y;

    .line 69
    .line 70
    if-eqz p3, :cond_1

    .line 71
    .line 72
    move-object p3, p2

    .line 73
    check-cast p3, Lcom/android/launcher3/BubbleTextView;

    .line 74
    .line 75
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 80
    .line 81
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    invoke-virtual {p3, p2}, Lcom/android/launcher3/BubbleTextView;->F(Z)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    if-eqz v0, :cond_3

    .line 94
    .line 95
    instance-of v0, p3, Lcom/android/launcher3/folder/FolderIcon;

    .line 96
    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    check-cast p2, Lcom/android/launcher3/model/data/p;

    .line 100
    .line 101
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    new-instance p2, Lcom/android/launcher3/C6;

    .line 106
    .line 107
    invoke-direct {p2, p1}, Lcom/android/launcher3/C6;-><init>(Ljava/util/List;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p3}, Landroid/view/View;->invalidate()V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_3
    instance-of p2, p2, Lcom/android/launcher3/model/data/A;

    .line 118
    .line 119
    if-eqz p2, :cond_5

    .line 120
    .line 121
    instance-of p2, p3, Lcom/android/launcher3/widget/suggest/m;

    .line 122
    .line 123
    if-eqz p2, :cond_5

    .line 124
    .line 125
    new-instance p2, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .line 129
    .line 130
    check-cast p3, Lcom/android/launcher3/widget/suggest/m;

    .line 131
    .line 132
    invoke-virtual {p3, p0, p2}, Lcom/android/launcher3/widget/suggest/m;->u0(Landroid/view/View;Ljava/util/ArrayList;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    :cond_4
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    if-eqz p2, :cond_5

    .line 144
    .line 145
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    check-cast p2, Lcom/android/launcher3/widget/suggest/e;

    .line 150
    .line 151
    move-object p3, p2

    .line 152
    check-cast p3, Landroid/view/View;

    .line 153
    .line 154
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    check-cast p3, Lcom/android/launcher3/model/data/y;

    .line 159
    .line 160
    instance-of v0, p2, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 161
    .line 162
    if-eqz v0, :cond_4

    .line 163
    .line 164
    if-eqz p3, :cond_4

    .line 165
    .line 166
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 167
    .line 168
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p3

    .line 172
    invoke-interface {p1, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p3

    .line 176
    invoke-virtual {p2, p3}, Lcom/android/launcher3/BubbleTextView;->F(Z)V

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_5
    :goto_2
    const/4 p0, 0x0

    .line 181
    return p0
.end method

.method public static synthetic Z(Lcom/android/launcher3/util/Y1;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Z2()V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/LayoutTransition;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->k:Landroid/animation/LayoutTransition;

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    invoke-virtual {v0, v1}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->k:Landroid/animation/LayoutTransition;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v0, v2}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->k:Landroid/animation/LayoutTransition;

    .line 19
    .line 20
    sget-object v3, LJ0/h;->H:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    const/high16 v5, 0x3f000000    # 0.5f

    .line 24
    .line 25
    invoke-static {v3, v4, v5}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {v0, v1, v4}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->k:Landroid/animation/LayoutTransition;

    .line 33
    .line 34
    const/high16 v1, 0x3f800000    # 1.0f

    .line 35
    .line 36
    invoke-static {v3, v5, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->k:Landroid/animation/LayoutTransition;

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    invoke-virtual {v0, v1}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->k:Landroid/animation/LayoutTransition;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {v0, v1}, Landroid/animation/LayoutTransition;->disableTransitionType(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->k:Landroid/animation/LayoutTransition;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic a0(Lcom/android/launcher3/util/Y1;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a2(FLcom/android/launcher3/n0$a;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->r:[I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/CellLayout;->L([I)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    cmpl-float p1, p1, v0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-lez p1, :cond_1

    .line 15
    .line 16
    iget p1, p0, Lcom/android/launcher3/Workspace;->V:I

    .line 17
    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    if-ne p1, v1, :cond_b

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0, v2}, Lcom/android/launcher3/Workspace;->setDragMode(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->r:[I

    .line 31
    .line 32
    aget v4, v3, v2

    .line 33
    .line 34
    aget v3, v3, v1

    .line 35
    .line 36
    invoke-virtual {p1, v4, v3}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const/4 p1, 0x0

    .line 42
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 43
    .line 44
    if-nez p1, :cond_3

    .line 45
    .line 46
    const-string p0, "Launcher.Workspace"

    .line 47
    .line 48
    const-string p1, "manageFolderFeedback--dragOverView == null"

    .line 49
    .line 50
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_3
    iget-object v3, p2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 55
    .line 56
    invoke-virtual {p0, v3, p1, v2}, Lcom/android/launcher3/Workspace;->E3(Lcom/android/launcher3/model/data/y;Landroid/view/View;Z)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iget v4, p0, Lcom/android/launcher3/Workspace;->V:I

    .line 61
    .line 62
    if-nez v4, :cond_7

    .line 63
    .line 64
    if-eqz p1, :cond_7

    .line 65
    .line 66
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-boolean p1, p1, Lcom/android/launcher3/X3;->B0:Z

    .line 73
    .line 74
    if-eqz p1, :cond_4

    .line 75
    .line 76
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 77
    .line 78
    if-eqz p1, :cond_4

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/android/launcher3/folder/u0;->f0()V

    .line 81
    .line 82
    .line 83
    :cond_4
    new-instance v3, Lcom/android/launcher3/folder/u0;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-direct {v3, p1}, Lcom/android/launcher3/folder/u0;-><init>(Landroid/content/Context;)V

    .line 90
    .line 91
    .line 92
    iput-object v3, p0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    iget-object v5, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    const/4 v6, 0x0

    .line 113
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/folder/u0;->Z0(Landroid/content/Context;Lcom/android/launcher3/views/k;Landroid/view/View;II)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 117
    .line 118
    iput-boolean v2, p1, Lcom/android/launcher3/folder/u0;->u:Z

    .line 119
    .line 120
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 121
    .line 122
    instance-of v3, p1, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 123
    .line 124
    if-eqz v3, :cond_5

    .line 125
    .line 126
    check-cast p1, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/android/launcher3/apppairs/AppPairIcon;->getIconDrawableArea()Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {p1, v0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->d(Ljava/lang/Integer;)V

    .line 137
    .line 138
    .line 139
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 140
    .line 141
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 142
    .line 143
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->r:[I

    .line 144
    .line 145
    aget v2, v3, v2

    .line 146
    .line 147
    aget v3, v3, v1

    .line 148
    .line 149
    invoke-virtual {p1, v0, v2, v3, p2}, Lcom/android/launcher3/folder/u0;->Y(Lcom/android/launcher3/CellLayout;IILcom/android/launcher3/n0$a;)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 153
    .line 154
    if-eqz p1, :cond_6

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->t()V

    .line 157
    .line 158
    .line 159
    :cond_6
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->setDragMode(I)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p2, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 163
    .line 164
    if-eqz p1, :cond_b

    .line 165
    .line 166
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-static {p2, p0}, LO0/u;->c0(Landroid/view/View;Landroid/content/Context;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p1, p0}, LO0/e;->a(Ljava/lang/CharSequence;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_7
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 181
    .line 182
    invoke-virtual {p0, v3, v4}, Lcom/android/launcher3/Workspace;->C3(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    if-eqz v4, :cond_9

    .line 187
    .line 188
    iget v5, p0, Lcom/android/launcher3/Workspace;->V:I

    .line 189
    .line 190
    if-nez v5, :cond_9

    .line 191
    .line 192
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 193
    .line 194
    check-cast p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 195
    .line 196
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->O:Lcom/android/launcher3/folder/FolderIcon;

    .line 197
    .line 198
    invoke-virtual {p1, v3}, Lcom/android/launcher3/folder/FolderIcon;->W(Lcom/android/launcher3/model/data/y;)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 202
    .line 203
    if-eqz p1, :cond_8

    .line 204
    .line 205
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->t()V

    .line 206
    .line 207
    .line 208
    :cond_8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->setDragMode(I)V

    .line 209
    .line 210
    .line 211
    iget-object p1, p2, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 212
    .line 213
    if-eqz p1, :cond_b

    .line 214
    .line 215
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 216
    .line 217
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-static {p2, p0}, LO0/u;->c0(Landroid/view/View;Landroid/content/Context;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-virtual {p1, p0}, LO0/e;->a(Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_9
    iget p2, p0, Lcom/android/launcher3/Workspace;->V:I

    .line 230
    .line 231
    if-ne p2, v0, :cond_a

    .line 232
    .line 233
    if-nez v4, :cond_a

    .line 234
    .line 235
    invoke-virtual {p0, v2}, Lcom/android/launcher3/Workspace;->setDragMode(I)V

    .line 236
    .line 237
    .line 238
    :cond_a
    iget p2, p0, Lcom/android/launcher3/Workspace;->V:I

    .line 239
    .line 240
    if-ne p2, v1, :cond_b

    .line 241
    .line 242
    if-nez p1, :cond_b

    .line 243
    .line 244
    invoke-virtual {p0, v2}, Lcom/android/launcher3/Workspace;->setDragMode(I)V

    .line 245
    .line 246
    .line 247
    :cond_b
    return-void
.end method

.method private a3(JLandroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-wide/16 v1, -0x65

    .line 18
    .line 19
    cmp-long p1, p1, v1

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v0, p3}, Lcom/android/launcher3/W3;->C(Lcom/android/launcher3/K5;Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public static synthetic b0(Lcom/android/launcher3/Workspace;Ljava/util/List;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/Workspace;->Y1(Ljava/util/List;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private b1(Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/16 v0, -0xc9

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p1, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J1()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/16 p0, -0xc8

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private b3(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/util/E;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_4

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    instance-of v1, v1, Lcom/android/launcher3/model/data/I;

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 44
    .line 45
    iget v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 46
    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 50
    .line 51
    iget-object v2, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 58
    .line 59
    invoke-direct {v1, v2, v0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    instance-of v1, v1, Lcom/android/launcher3/model/data/d;

    .line 71
    .line 72
    if-eqz v1, :cond_1

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 79
    .line 80
    iget v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 81
    .line 82
    if-nez v1, :cond_1

    .line 83
    .line 84
    new-instance v1, Lcom/android/launcher3/util/E;

    .line 85
    .line 86
    iget-object v2, v0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 87
    .line 88
    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 93
    .line 94
    invoke-direct {v1, v2, v0}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_3
    return-object p0

    .line 102
    :cond_4
    :goto_1
    const/4 p0, 0x0

    .line 103
    return-object p0
.end method

.method public static synthetic c0(I)[Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    new-array p0, p0, [Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method

.method private c3(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->H3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->isVisible(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public static synthetic d0(Ljava/util/List;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private d1([I[FLcom/android/launcher3/CellLayout;)F
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v2, p1, v0

    .line 3
    .line 4
    const/4 v7, 0x1

    .line 5
    aget v3, p1, v7

    .line 6
    .line 7
    new-instance v6, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-virtual {p1, p3}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    const/4 v5, 0x1

    .line 22
    move-object v1, p3

    .line 23
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/CellLayout;->o(IIIILandroid/graphics/Rect;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v1, p3

    .line 28
    const/4 v4, 0x1

    .line 29
    const/4 v5, 0x1

    .line 30
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget p1, p0, Lcom/android/launcher3/X3;->s:I

    .line 40
    .line 41
    iget p0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 42
    .line 43
    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    iget v2, v6, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    add-int/2addr v2, p1

    .line 50
    div-int/lit8 p0, p0, 0x2

    .line 51
    .line 52
    add-int/2addr v2, p0

    .line 53
    invoke-static {}, Lx1/O;->C3()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    instance-of p0, v1, Lcom/android/launcher3/Hotseat;

    .line 60
    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    :cond_1
    aget p0, p2, v0

    .line 68
    .line 69
    int-to-float p1, p3

    .line 70
    sub-float/2addr p0, p1

    .line 71
    float-to-double p0, p0

    .line 72
    aget p2, p2, v7

    .line 73
    .line 74
    int-to-float p3, v2

    .line 75
    sub-float/2addr p2, p3

    .line 76
    float-to-double p2, p2

    .line 77
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->hypot(DD)D

    .line 78
    .line 79
    .line 80
    move-result-wide p0

    .line 81
    double-to-float p0, p0

    .line 82
    return p0
.end method

.method private d3(Lcom/android/launcher3/n0$a;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->C1(Lcom/android/launcher3/n0$a;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lm1/a;->a()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {}, Lx1/O;->C3()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->B:Landroid/graphics/Rect;

    .line 57
    .line 58
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/Workspace;->m1(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->B:Landroid/graphics/Rect;

    .line 62
    .line 63
    iget v0, p1, Lcom/android/launcher3/n0$a;->a:I

    .line 64
    .line 65
    iget p1, p1, Lcom/android/launcher3/n0$a;->b:I

    .line 66
    .line 67
    invoke-virtual {p0, v0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    return p0

    .line 72
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 73
    return p0
.end method

.method public static synthetic e0(Ljava/util/List;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private e1([I[FLcom/android/launcher3/dragndrop/v;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;[IZLandroid/view/View;)V
    .locals 16

    .line 1
    move-object/from16 v6, p1

    .line 2
    .line 3
    move-object/from16 v7, p5

    .line 4
    .line 5
    iget v4, v7, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 6
    .line 7
    iget v5, v7, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 8
    .line 9
    const/4 v8, 0x0

    .line 10
    aget v2, p6, v8

    .line 11
    .line 12
    const/4 v9, 0x1

    .line 13
    aget v3, p6, v9

    .line 14
    .line 15
    move-object/from16 v0, p0

    .line 16
    .line 17
    move-object/from16 v1, p4

    .line 18
    .line 19
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/Workspace;->Y0(Lcom/android/launcher3/CellLayout;IIII)Landroid/graphics/Rect;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget v1, v7, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 24
    .line 25
    const/4 v3, 0x4

    .line 26
    if-ne v1, v3, :cond_1

    .line 27
    .line 28
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    move-object/from16 v3, p8

    .line 35
    .line 36
    instance-of v3, v3, Lcom/android/launcher3/widget/x0;

    .line 37
    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    iget-object v3, v1, Lcom/android/launcher3/h0;->m3:Landroid/graphics/Rect;

    .line 41
    .line 42
    iget v4, v2, Landroid/graphics/Rect;->left:I

    .line 43
    .line 44
    iget v5, v3, Landroid/graphics/Rect;->left:I

    .line 45
    .line 46
    sub-int/2addr v4, v5

    .line 47
    iput v4, v2, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    iget v4, v2, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    iget v5, v3, Landroid/graphics/Rect;->right:I

    .line 52
    .line 53
    add-int/2addr v4, v5

    .line 54
    iput v4, v2, Landroid/graphics/Rect;->right:I

    .line 55
    .line 56
    iget v4, v2, Landroid/graphics/Rect;->top:I

    .line 57
    .line 58
    iget v5, v3, Landroid/graphics/Rect;->top:I

    .line 59
    .line 60
    sub-int/2addr v4, v5

    .line 61
    iput v4, v2, Landroid/graphics/Rect;->top:I

    .line 62
    .line 63
    iget v4, v2, Landroid/graphics/Rect;->bottom:I

    .line 64
    .line 65
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 66
    .line 67
    add-int/2addr v4, v3

    .line 68
    iput v4, v2, Landroid/graphics/Rect;->bottom:I

    .line 69
    .line 70
    :cond_0
    const/4 v3, 0x0

    .line 71
    invoke-virtual {v1, v3}, Lcom/android/launcher3/h0;->Y(Lcom/android/launcher3/model/data/y;)Landroid/graphics/PointF;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 76
    .line 77
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 78
    .line 79
    invoke-static {v2, v3, v1}, Lcom/android/launcher3/N5;->d0(Landroid/graphics/Rect;FF)F

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->A:[F

    .line 83
    .line 84
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 85
    .line 86
    int-to-float v3, v3

    .line 87
    aput v3, v1, v8

    .line 88
    .line 89
    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 90
    .line 91
    int-to-float v3, v3

    .line 92
    aput v3, v1, v9

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->V2()V

    .line 95
    .line 96
    .line 97
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->A:[F

    .line 104
    .line 105
    move-object/from16 v4, p4

    .line 106
    .line 107
    invoke-virtual {v1, v4, v3, v9}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[FZ)F

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->Q2()V

    .line 112
    .line 113
    .line 114
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->A:[F

    .line 115
    .line 116
    invoke-static {v0, v6}, Lcom/android/launcher3/N5;->Y([F[I)V

    .line 117
    .line 118
    .line 119
    const/high16 v0, 0x3f800000    # 1.0f

    .line 120
    .line 121
    const/high16 v3, 0x40000000    # 2.0f

    .line 122
    .line 123
    if-eqz p7, :cond_6

    .line 124
    .line 125
    invoke-virtual/range {p3 .. p3}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    invoke-virtual/range {p3 .. p3}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 130
    .line 131
    .line 132
    move-result v7

    .line 133
    if-eqz v5, :cond_2

    .line 134
    .line 135
    if-nez v7, :cond_5

    .line 136
    .line 137
    :cond_2
    const-string v5, "Launcher.Workspace"

    .line 138
    .line 139
    const-string v7, "getFinalPositionForDropAnimation: getMeasuredWidth or getMeasuredHeight is 0"

    .line 140
    .line 141
    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    if-nez v5, :cond_3

    .line 149
    .line 150
    move v5, v9

    .line 151
    goto :goto_0

    .line 152
    :cond_3
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    :goto_0
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    if-nez v7, :cond_4

    .line 161
    .line 162
    move v7, v9

    .line 163
    goto :goto_1

    .line 164
    :cond_4
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    :cond_5
    :goto_1
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 169
    .line 170
    .line 171
    move-result v10

    .line 172
    int-to-float v10, v10

    .line 173
    mul-float/2addr v10, v0

    .line 174
    int-to-float v5, v5

    .line 175
    div-float/2addr v10, v5

    .line 176
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 177
    .line 178
    .line 179
    move-result v11

    .line 180
    int-to-float v11, v11

    .line 181
    mul-float/2addr v11, v0

    .line 182
    int-to-float v0, v7

    .line 183
    div-float/2addr v11, v0

    .line 184
    aget v7, v6, v8

    .line 185
    .line 186
    int-to-double v12, v7

    .line 187
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 188
    .line 189
    .line 190
    move-result v7

    .line 191
    int-to-float v7, v7

    .line 192
    mul-float/2addr v7, v1

    .line 193
    sub-float/2addr v5, v7

    .line 194
    div-float/2addr v5, v3

    .line 195
    float-to-double v14, v5

    .line 196
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getUnusedHorizontalSpace()I

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    int-to-float v4, v4

    .line 201
    div-float/2addr v4, v3

    .line 202
    float-to-double v4, v4

    .line 203
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 204
    .line 205
    .line 206
    move-result-wide v4

    .line 207
    sub-double/2addr v14, v4

    .line 208
    sub-double/2addr v12, v14

    .line 209
    double-to-int v4, v12

    .line 210
    aput v4, v6, v8

    .line 211
    .line 212
    aget v4, v6, v9

    .line 213
    .line 214
    int-to-float v4, v4

    .line 215
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    int-to-float v2, v2

    .line 220
    mul-float/2addr v2, v1

    .line 221
    sub-float/2addr v0, v2

    .line 222
    div-float/2addr v0, v3

    .line 223
    sub-float/2addr v4, v0

    .line 224
    float-to-int v0, v4

    .line 225
    aput v0, v6, v9

    .line 226
    .line 227
    mul-float/2addr v10, v1

    .line 228
    aput v10, p2, v8

    .line 229
    .line 230
    mul-float/2addr v11, v1

    .line 231
    aput v11, p2, v9

    .line 232
    .line 233
    return-void

    .line 234
    :cond_6
    invoke-virtual/range {p3 .. p3}, Lcom/android/launcher3/dragndrop/v;->getInitialScale()F

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    mul-float/2addr v2, v1

    .line 239
    aget v4, v6, v8

    .line 240
    .line 241
    int-to-float v4, v4

    .line 242
    sub-float v0, v2, v0

    .line 243
    .line 244
    invoke-virtual/range {p3 .. p3}, Landroid/widget/FrameLayout;->getWidth()I

    .line 245
    .line 246
    .line 247
    move-result v5

    .line 248
    int-to-float v5, v5

    .line 249
    mul-float/2addr v5, v0

    .line 250
    div-float/2addr v5, v3

    .line 251
    add-float/2addr v4, v5

    .line 252
    float-to-int v4, v4

    .line 253
    aput v4, v6, v8

    .line 254
    .line 255
    aget v4, v6, v9

    .line 256
    .line 257
    int-to-float v4, v4

    .line 258
    invoke-virtual/range {p3 .. p3}, Landroid/widget/FrameLayout;->getHeight()I

    .line 259
    .line 260
    .line 261
    move-result v5

    .line 262
    int-to-float v5, v5

    .line 263
    mul-float/2addr v0, v5

    .line 264
    div-float/2addr v0, v3

    .line 265
    add-float/2addr v4, v0

    .line 266
    float-to-int v0, v4

    .line 267
    aput v0, v6, v9

    .line 268
    .line 269
    aput v2, p2, v9

    .line 270
    .line 271
    aput v2, p2, v8

    .line 272
    .line 273
    invoke-virtual/range {p3 .. p3}, Lcom/android/launcher3/dragndrop/v;->getDragRegion()Landroid/graphics/Rect;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    if-eqz v0, :cond_7

    .line 278
    .line 279
    aget v2, v6, v8

    .line 280
    .line 281
    int-to-float v2, v2

    .line 282
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 283
    .line 284
    int-to-float v3, v3

    .line 285
    mul-float/2addr v3, v1

    .line 286
    add-float/2addr v2, v3

    .line 287
    float-to-int v2, v2

    .line 288
    aput v2, v6, v8

    .line 289
    .line 290
    aget v2, v6, v9

    .line 291
    .line 292
    int-to-float v2, v2

    .line 293
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 294
    .line 295
    int-to-float v0, v0

    .line 296
    mul-float/2addr v1, v0

    .line 297
    add-float/2addr v2, v1

    .line 298
    float-to-int v0, v2

    .line 299
    aput v0, v6, v9

    .line 300
    .line 301
    :cond_7
    return-void
.end method

.method public static e2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 0

    .line 1
    filled-new-array {p0}, [Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/Workspace;->g2([Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic f0(Ljava/lang/Object;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method private f1(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Landroid/view/View;

    .line 3
    .line 4
    new-instance v1, Lcom/android/launcher3/e6;

    .line 5
    .line 6
    invoke-direct {v1, p1, v0}, Lcom/android/launcher3/e6;-><init>(Lcom/android/launcher3/util/Y0$a;[Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/Folder;->w1(Lcom/android/launcher3/util/Y0$a;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    aget-object p0, v0, p0

    .line 25
    .line 26
    return-object p0
.end method

.method public static synthetic g0(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/CellLayout;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->O1(Lcom/android/launcher3/CellLayout;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static g2([Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 9

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_8

    .line 5
    .line 6
    aget-object v3, p0, v2

    .line 7
    .line 8
    if-nez v3, :cond_0

    .line 9
    .line 10
    goto/16 :goto_4

    .line 11
    .line 12
    :cond_0
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    move v5, v1

    .line 21
    :goto_1
    if-ge v5, v4, :cond_7

    .line 22
    .line 23
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    instance-of v7, v7, Lcom/android/launcher3/model/data/y;

    .line 32
    .line 33
    if-nez v7, :cond_1

    .line 34
    .line 35
    goto :goto_3

    .line 36
    :cond_1
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    invoke-interface {p1, v7, v6}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    if-eqz v7, :cond_2

    .line 47
    .line 48
    return-object v6

    .line 49
    :cond_2
    instance-of v7, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 50
    .line 51
    if-eqz v7, :cond_3

    .line 52
    .line 53
    move-object v7, v6

    .line 54
    check-cast v7, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 55
    .line 56
    iget-object v7, v7, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 57
    .line 58
    invoke-static {v7, p1}, Lcom/android/launcher3/Workspace;->e2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    if-eqz v7, :cond_3

    .line 63
    .line 64
    return-object v7

    .line 65
    :cond_3
    instance-of v7, v6, Lcom/android/launcher3/widget/T;

    .line 66
    .line 67
    if-eqz v7, :cond_6

    .line 68
    .line 69
    check-cast v6, Lcom/android/launcher3/widget/T;

    .line 70
    .line 71
    invoke-virtual {v6}, Lcom/android/launcher3/widget/T;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    if-eqz v6, :cond_6

    .line 76
    .line 77
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    if-nez v7, :cond_6

    .line 82
    .line 83
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    :cond_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    if-eqz v7, :cond_6

    .line 92
    .line 93
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    check-cast v7, Landroid/appwidget/AppWidgetHostView;

    .line 98
    .line 99
    if-eqz v7, :cond_5

    .line 100
    .line 101
    invoke-virtual {v7}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v8

    .line 105
    instance-of v8, v8, Lcom/android/launcher3/model/data/y;

    .line 106
    .line 107
    if-eqz v8, :cond_5

    .line 108
    .line 109
    invoke-virtual {v7}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v8

    .line 113
    check-cast v8, Lcom/android/launcher3/model/data/y;

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_5
    new-instance v8, Lcom/android/launcher3/model/data/y;

    .line 117
    .line 118
    invoke-direct {v8}, Lcom/android/launcher3/model/data/y;-><init>()V

    .line 119
    .line 120
    .line 121
    :goto_2
    if-eqz v7, :cond_4

    .line 122
    .line 123
    invoke-interface {p1, v8, v7}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 124
    .line 125
    .line 126
    move-result v8

    .line 127
    if-eqz v8, :cond_4

    .line 128
    .line 129
    return-object v7

    .line 130
    :cond_6
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_7
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    const/4 p0, 0x0

    .line 138
    return-object p0
.end method

.method private getCurrentWorkspaceAndHotseatCellLayout()[Lcom/android/launcher3/CellLayout;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    new-array v0, v0, [Lcom/android/launcher3/CellLayout;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    aput-object v2, v0, v1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-array v0, v1, [Lcom/android/launcher3/CellLayout;

    .line 23
    .line 24
    :goto_0
    iget v1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/launcher3/CellLayout;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    aput-object v1, v0, v2

    .line 34
    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v2, "mCurrentPage = "

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 48
    .line 49
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v1, "Launcher.Workspace"

    .line 57
    .line 58
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    :cond_1
    return-object v0
.end method

.method private getWorkspaceAndHotseatCellLayouts()[Lcom/android/launcher3/CellLayout;
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    add-int/lit8 v1, v0, 0x1

    .line 14
    .line 15
    new-array v1, v1, [Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    aput-object v2, v1, v0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-array v1, v0, [Lcom/android/launcher3/CellLayout;

    .line 27
    .line 28
    :goto_0
    const/4 v2, 0x0

    .line 29
    move v3, v2

    .line 30
    :goto_1
    if-ge v3, v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, v3}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    check-cast v4, Lcom/android/launcher3/CellLayout;

    .line 37
    .line 38
    aput-object v4, v1, v3

    .line 39
    .line 40
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    invoke-static {}, Lx1/O;->C3()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    new-instance v0, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 55
    .line 56
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 63
    .line 64
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v3}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    new-array v1, v1, [Lcom/android/launcher3/CellLayout;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    move-object v1, v0

    .line 105
    check-cast v1, [Lcom/android/launcher3/CellLayout;

    .line 106
    .line 107
    :cond_2
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 114
    .line 115
    if-eqz v0, :cond_3

    .line 116
    .line 117
    invoke-static {v1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v2, Lcom/android/launcher3/n6;

    .line 122
    .line 123
    invoke-direct {v2, p0}, Lcom/android/launcher3/n6;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 124
    .line 125
    .line 126
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_3

    .line 131
    .line 132
    new-instance v0, Ljava/util/ArrayList;

    .line 133
    .line 134
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 142
    .line 143
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    new-array p0, p0, [Lcom/android/launcher3/CellLayout;

    .line 151
    .line 152
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    check-cast p0, [Lcom/android/launcher3/CellLayout;

    .line 157
    .line 158
    return-object p0

    .line 159
    :cond_3
    return-object v1
.end method

.method public static synthetic h0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of p0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->getDownloadInstallDrawable()Lr1/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/BubbleTextView;->D0()V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public static h2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)V
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    instance-of v3, v3, Lcom/android/launcher3/model/data/y;

    .line 24
    .line 25
    if-nez v3, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    invoke-interface {p1, v3, v2}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    :goto_2
    return-void
.end method

.method public static synthetic i0(ZLcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    iput-boolean p0, p1, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 2
    .line 3
    return-void
.end method

.method private i2(Lcom/android/launcher3/util/Y0$a;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->getWorkspaceAndHotseatCellLayouts()[Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v2, v0, :cond_3

    .line 9
    .line 10
    aget-object v3, p0, v2

    .line 11
    .line 12
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    move v5, v1

    .line 21
    :goto_1
    if-ge v5, v4, :cond_2

    .line 22
    .line 23
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    instance-of v7, v7, Lcom/android/launcher3/model/data/y;

    .line 32
    .line 33
    if-nez v7, :cond_0

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_0
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    instance-of v8, v7, Lcom/android/launcher3/model/data/I;

    .line 43
    .line 44
    if-eqz v8, :cond_1

    .line 45
    .line 46
    instance-of v8, v6, Lcom/android/launcher3/BubbleTextView;

    .line 47
    .line 48
    if-eqz v8, :cond_1

    .line 49
    .line 50
    invoke-interface {p1, v7, v6}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    return-void
.end method

.method public static synthetic j0(ZLcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 7
    .line 8
    instance-of v1, p2, Lcom/android/launcher3/BubbleTextView;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 13
    .line 14
    invoke-static {v0}, Lx1/O;->J2(Lcom/android/launcher3/model/data/I;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    invoke-virtual {p2, p0}, Lcom/android/launcher3/BubbleTextView;->C(Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    instance-of p1, p1, Lcom/android/launcher3/model/data/p;

    .line 25
    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    instance-of p1, p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 29
    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    check-cast p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllModeChildBubbleTextViewList()Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_2

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    instance-of v1, v0, Lcom/android/launcher3/model/data/I;

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 63
    .line 64
    invoke-static {v0}, Lx1/O;->J2(Lcom/android/launcher3/model/data/I;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p2, p0}, Lcom/android/launcher3/BubbleTextView;->C(Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 75
    return p0
.end method

.method private j2(Lcom/android/launcher3/util/Y0$a;)Z
    .locals 9

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->getWorkspaceAndHotseatCellLayouts()[Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v2, v0, :cond_3

    .line 9
    .line 10
    aget-object v3, p0, v2

    .line 11
    .line 12
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    move v5, v1

    .line 21
    :goto_1
    if-ge v5, v4, :cond_2

    .line 22
    .line 23
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    instance-of v7, v7, Lcom/android/launcher3/model/data/y;

    .line 32
    .line 33
    if-nez v7, :cond_0

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_0
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    instance-of v8, v7, Lcom/android/launcher3/model/data/p;

    .line 43
    .line 44
    if-eqz v8, :cond_1

    .line 45
    .line 46
    instance-of v8, v6, Lcom/android/launcher3/folder/FolderIcon;

    .line 47
    .line 48
    if-eqz v8, :cond_1

    .line 49
    .line 50
    invoke-interface {p1, v7, v6}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    if-eqz v6, :cond_1

    .line 55
    .line 56
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :cond_1
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    return v1
.end method

.method private j3()V
    .locals 9

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->M0()Lcom/android/launcher3/CellLayout;

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 19
    .line 20
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v2, "tmpRemoveOrAddAIFutureScreen isInMenuOverView="

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, " mTempAiFutureScreenId="

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget v2, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v2, " mTempRemoveAiFutureScreen="

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 55
    .line 56
    const/4 v4, 0x1

    .line 57
    const/4 v5, 0x0

    .line 58
    if-eqz v3, :cond_2

    .line 59
    .line 60
    move v3, v4

    .line 61
    goto :goto_0

    .line 62
    :cond_2
    move v3, v5

    .line 63
    :goto_0
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v3, "Launcher.Workspace"

    .line 71
    .line 72
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->U0()V

    .line 76
    .line 77
    .line 78
    const-string v1, " mWorkspaceScreens="

    .line 79
    .line 80
    const-string v6, " mScreenOrder="

    .line 81
    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    iget-object v7, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 85
    .line 86
    if-nez v7, :cond_3

    .line 87
    .line 88
    iget v7, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 89
    .line 90
    if-gez v7, :cond_3

    .line 91
    .line 92
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0, v5}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    new-instance v2, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v5, "tmpRemoveOrAddAIFutureScreen remove aiScreenId="

    .line 108
    .line 109
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v5, " containsKey="

    .line 116
    .line 117
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v5, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 121
    .line 122
    invoke-virtual {v5, v0}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    if-lez v0, :cond_5

    .line 137
    .line 138
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 139
    .line 140
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-eqz v2, :cond_5

    .line 145
    .line 146
    iput v0, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 147
    .line 148
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 149
    .line 150
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 155
    .line 156
    iput-object v2, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 157
    .line 158
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 159
    .line 160
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 164
    .line 165
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->remove(I)V

    .line 166
    .line 167
    .line 168
    new-instance v2, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .line 172
    .line 173
    const-string v5, "tmpRemoveOrAddAIFutureScreen remove end aiScreenId="

    .line 174
    .line 175
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 185
    .line 186
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 197
    .line 198
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 209
    .line 210
    sub-int/2addr v0, v4

    .line 211
    iput v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 212
    .line 213
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 214
    .line 215
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->removeView(Landroid/view/View;)V

    .line 222
    .line 223
    .line 224
    goto/16 :goto_2

    .line 225
    .line 226
    :cond_3
    if-nez v0, :cond_5

    .line 227
    .line 228
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 229
    .line 230
    if-eqz v0, :cond_5

    .line 231
    .line 232
    iget v0, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 233
    .line 234
    if-lez v0, :cond_5

    .line 235
    .line 236
    iget-object v7, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 237
    .line 238
    invoke-virtual {v7, v5, v0}, Lcom/android/launcher3/util/x0;->n(II)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 242
    .line 243
    iget v7, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 244
    .line 245
    iget-object v8, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 246
    .line 247
    invoke-virtual {v0, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 248
    .line 249
    .line 250
    new-instance v0, Ljava/lang/StringBuilder;

    .line 251
    .line 252
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 253
    .line 254
    .line 255
    const-string v7, "tmpRemoveOrAddAIFutureScreen add mTempAiFutureScreenId="

    .line 256
    .line 257
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    iget v7, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 261
    .line 262
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 269
    .line 270
    if-eqz v2, :cond_4

    .line 271
    .line 272
    move v2, v4

    .line 273
    goto :goto_1

    .line 274
    :cond_4
    move v2, v5

    .line 275
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 282
    .line 283
    invoke-virtual {v2}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 294
    .line 295
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    .line 304
    .line 305
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 306
    .line 307
    add-int/2addr v0, v4

    .line 308
    iput v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 309
    .line 310
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 311
    .line 312
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 317
    .line 318
    invoke-virtual {v0, v1, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 319
    .line 320
    .line 321
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 322
    .line 323
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 328
    .line 329
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    invoke-virtual {v0, v1}, Lx1/Z;->a(Lcom/android/launcher3/Workspace;)V

    .line 334
    .line 335
    .line 336
    const/4 v0, -0x1

    .line 337
    iput v0, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 338
    .line 339
    const/4 v0, 0x0

    .line 340
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 341
    .line 342
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->r1()Z

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    if-eqz v0, :cond_5

    .line 347
    .line 348
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->i3()V

    .line 349
    .line 350
    .line 351
    :cond_5
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->enableLayoutTransitions()V

    .line 352
    .line 353
    .line 354
    return-void
.end method

.method public static synthetic k0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of p0, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    check-cast p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getCloudFolder()Lcom/android/launcher3/cloudfolder/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->Z1()V

    .line 32
    .line 33
    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public static synthetic l0(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/widget/T;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/Workspace;->N1(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/widget/T;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l3()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/android/launcher3/Workspace;->e0:F

    .line 8
    .line 9
    const/high16 v1, 0x3e800000    # 0.25f

    .line 10
    .line 11
    cmpl-float v0, v0, v1

    .line 12
    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->H3()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static synthetic m0(Lcom/android/launcher3/util/Y0$a;[Landroid/view/View;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-interface {p0, p2, p3}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p2, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    aput-object p3, p1, p2

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    return p2
.end method

.method private m1(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->B:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->B:Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/views/BaseDragLayer;->mapRectInSelfToDescendant(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->B:Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-virtual {p2, p0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic n0(Ljava/util/HashSet;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of v0, p2, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 12
    .line 13
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    instance-of p1, p0, Ln1/r;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    check-cast p0, Ln1/r;

    .line 24
    .line 25
    invoke-virtual {p0}, Ln1/r;->z()Z

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    instance-of p1, p1, Lcom/android/launcher3/model/data/p;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    instance-of p1, p2, Lcom/android/launcher3/folder/FolderIcon;

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    check-cast p2, Lcom/android/launcher3/folder/FolderIcon;

    .line 38
    .line 39
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    new-instance p1, Lcom/android/launcher3/A6;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Lcom/android/launcher3/A6;-><init>(Ljava/util/HashSet;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, p1}, Lcom/android/launcher3/folder/FolderIcon;->q0(Ljava/util/function/Predicate;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method private n2(Lcom/android/launcher3/CellLayout;[F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, p0, p2, v1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[FZ)F

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/views/BaseDragLayer;->mapCoordInSelfToDescendant(Landroid/view/View;[F)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/Workspace;->o2(Landroid/view/View;[F)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic o0(ILcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p2, p1, Lcom/android/launcher3/model/data/A;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/A;

    .line 6
    .line 7
    iget p1, p1, Lcom/android/launcher3/model/data/A;->g:I

    .line 8
    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private o1(I)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/l3;->p(I)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private o3(ILcom/android/launcher3/CellLayout;)V
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic p0(Lcom/android/launcher3/Workspace;ILcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/Workspace;->V1(ILcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private p2(I[F)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    aget p1, p2, v2

    .line 11
    .line 12
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    int-to-float v0, v0

    .line 26
    sub-float/2addr p1, v0

    .line 27
    aput p1, p2, v2

    .line 28
    .line 29
    aget p1, p2, v3

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    int-to-float p0, p0

    .line 40
    sub-float/2addr p1, p0

    .line 41
    aput p1, p2, v3

    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-ne p1, v0, :cond_3

    .line 49
    .line 50
    aget p1, p2, v2

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    sub-int/2addr v0, v3

    .line 57
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    sub-int/2addr v0, v1

    .line 70
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    add-int/2addr v0, v1

    .line 75
    iget v1, p0, Lcom/android/launcher3/V4;->mPageSpacing:I

    .line 76
    .line 77
    div-int/lit8 v1, v1, 0x2

    .line 78
    .line 79
    add-int/2addr v0, v1

    .line 80
    int-to-float v0, v0

    .line 81
    sub-float/2addr p1, v0

    .line 82
    aput p1, p2, v2

    .line 83
    .line 84
    aget p1, p2, v3

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    sub-int/2addr v0, v3

    .line 91
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    int-to-float p0, p0

    .line 100
    sub-float/2addr p1, p0

    .line 101
    aput p1, p2, v3

    .line 102
    .line 103
    return-void

    .line 104
    :cond_1
    if-ne p1, v1, :cond_2

    .line 105
    .line 106
    aget p1, p2, v2

    .line 107
    .line 108
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    sub-int/2addr v0, v1

    .line 121
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    add-int/2addr v0, v1

    .line 126
    iget v1, p0, Lcom/android/launcher3/V4;->mPageSpacing:I

    .line 127
    .line 128
    div-int/lit8 v1, v1, 0x2

    .line 129
    .line 130
    add-int/2addr v0, v1

    .line 131
    int-to-float v0, v0

    .line 132
    sub-float/2addr p1, v0

    .line 133
    aput p1, p2, v2

    .line 134
    .line 135
    aget p1, p2, v3

    .line 136
    .line 137
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    sub-int/2addr v0, v3

    .line 142
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    int-to-float p0, p0

    .line 151
    sub-float/2addr p1, p0

    .line 152
    aput p1, p2, v3

    .line 153
    .line 154
    return-void

    .line 155
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-ne p1, v0, :cond_3

    .line 160
    .line 161
    aget p1, p2, v2

    .line 162
    .line 163
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    sub-int/2addr v0, v3

    .line 168
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    add-int/2addr v0, v1

    .line 181
    int-to-float v0, v0

    .line 182
    sub-float/2addr p1, v0

    .line 183
    aput p1, p2, v2

    .line 184
    .line 185
    aget p1, p2, v3

    .line 186
    .line 187
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    sub-int/2addr v0, v3

    .line 192
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    int-to-float p0, p0

    .line 201
    sub-float/2addr p1, p0

    .line 202
    aput p1, p2, v3

    .line 203
    .line 204
    :cond_3
    return-void
.end method

.method public static synthetic q0(Ljava/util/ArrayList;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p2, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 16
    .line 17
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, p1}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private q1(Lcom/android/launcher3/dragndrop/p;Lcom/android/launcher3/widget/T;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget p1, p1, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance p1, Lcom/android/launcher3/r6;

    .line 12
    .line 13
    invoke-direct {p1, p0, p4, p3, p2}, Lcom/android/launcher3/r6;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/widget/T;)V

    .line 14
    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method private q3()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/android/launcher3/h0;->q1:Landroid/graphics/Rect;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 10
    .line 11
    new-instance v2, Lcom/android/launcher3/D6;

    .line 12
    .line 13
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/D6;-><init>(Lcom/android/launcher3/Workspace;Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v1, v2}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic r0(Lcom/android/launcher3/Workspace;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->K1(Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r3()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->E:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageInTransition()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v1

    .line 14
    goto :goto_1

    .line 15
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 16
    :goto_1
    iget-boolean v2, p0, Lcom/android/launcher3/Workspace;->F:Z

    .line 17
    .line 18
    if-eq v0, v2, :cond_3

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->F:Z

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->X0()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    move v0, v1

    .line 29
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ge v0, v2, :cond_3

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Lcom/android/launcher3/CellLayout;->D(Z)V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    return-void
.end method

.method public static synthetic s0(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/util/z0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/Workspace;->M1(Lcom/android/launcher3/util/z0;Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t0(ILcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic u0(Lcom/android/launcher3/Workspace;ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/Workspace;->T1(ZLjava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private u2([ILcom/android/launcher3/CellLayout;Lcom/android/launcher3/n0$a;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    move-object/from16 v11, p3

    .line 6
    .line 7
    iget-object v1, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    instance-of v3, v1, Lcom/android/launcher3/widget/y0;

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    check-cast v1, Lcom/android/launcher3/widget/y0;

    .line 14
    .line 15
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Lcom/android/launcher3/widget/y0;->P(Landroid/content/Context;)LD1/i;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, LD1/i;->c()Lcom/android/launcher3/model/data/I;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iput-object v1, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    :cond_0
    iget-object v12, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 30
    .line 31
    iget v1, v12, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 32
    .line 33
    iget v3, v12, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 34
    .line 35
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 36
    .line 37
    if-eqz v4, :cond_1

    .line 38
    .line 39
    iget v1, v4, Lcom/android/launcher3/util/C;->c:I

    .line 40
    .line 41
    iget v3, v4, Lcom/android/launcher3/util/C;->d:I

    .line 42
    .line 43
    :cond_1
    move v4, v3

    .line 44
    move v3, v1

    .line 45
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    const/16 v1, -0x65

    .line 54
    .line 55
    :goto_0
    move v13, v1

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    const/16 v1, -0x64

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :goto_1
    invoke-virtual {v0, v2}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 61
    .line 62
    .line 63
    move-result v14

    .line 64
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_3

    .line 71
    .line 72
    iget v1, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eq v14, v1, :cond_3

    .line 79
    .line 80
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    sget-object v5, Lcom/android/launcher3/V3;->q:Lcom/android/launcher3/V3;

    .line 83
    .line 84
    invoke-interface {v1, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_3

    .line 89
    .line 90
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 91
    .line 92
    sget-object v5, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 93
    .line 94
    invoke-interface {v1, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_3

    .line 99
    .line 100
    invoke-virtual {v0, v14}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 105
    .line 106
    .line 107
    :cond_3
    instance-of v1, v12, Lcom/android/launcher3/W4;

    .line 108
    .line 109
    const/4 v15, 0x6

    .line 110
    const-string v7, "Launcher.Workspace"

    .line 111
    .line 112
    const/4 v8, 0x0

    .line 113
    const/4 v9, 0x1

    .line 114
    if-eqz v1, :cond_1a

    .line 115
    .line 116
    move-object v10, v12

    .line 117
    check-cast v10, Lcom/android/launcher3/W4;

    .line 118
    .line 119
    iget v1, v10, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 120
    .line 121
    if-ne v1, v15, :cond_6

    .line 122
    .line 123
    aget v1, p1, v8

    .line 124
    .line 125
    aget v2, p1, v9

    .line 126
    .line 127
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 128
    .line 129
    move-object/from16 v5, p2

    .line 130
    .line 131
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/Workspace;->a1(IIIILcom/android/launcher3/CellLayout;[I)[I

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    move-object v2, v5

    .line 136
    iput-object v1, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 137
    .line 138
    iget-boolean v3, v0, Lcom/android/launcher3/Workspace;->r0:Z

    .line 139
    .line 140
    if-eqz v3, :cond_4

    .line 141
    .line 142
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 143
    .line 144
    aget v4, v3, v8

    .line 145
    .line 146
    aget v3, v3, v9

    .line 147
    .line 148
    invoke-virtual {v2, v4, v3, v1}, Lcom/android/launcher3/CellLayout;->K(FF[I)F

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    :goto_2
    move v4, v1

    .line 153
    goto :goto_3

    .line 154
    :cond_4
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 155
    .line 156
    invoke-direct {v0, v1, v3, v2}, Lcom/android/launcher3/Workspace;->d1([I[FLcom/android/launcher3/CellLayout;)F

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    goto :goto_2

    .line 161
    :goto_3
    iget-object v1, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 162
    .line 163
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 164
    .line 165
    const/4 v5, 0x1

    .line 166
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/Workspace;->F3(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;[IFZ)Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    move-object v15, v0

    .line 171
    if-nez v1, :cond_5

    .line 172
    .line 173
    iget-object v0, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 174
    .line 175
    iget-object v1, v15, Lcom/android/launcher3/Workspace;->r:[I

    .line 176
    .line 177
    invoke-virtual {v15, v0, v2, v1, v4}, Lcom/android/launcher3/Workspace;->D3(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;[IF)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_7

    .line 182
    .line 183
    :cond_5
    move v0, v8

    .line 184
    goto :goto_4

    .line 185
    :cond_6
    move-object v15, v0

    .line 186
    :cond_7
    move v0, v9

    .line 187
    :goto_4
    iget-object v1, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 188
    .line 189
    if-eqz v0, :cond_b

    .line 190
    .line 191
    iget v0, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 192
    .line 193
    iget v3, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 194
    .line 195
    iget v4, v1, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 196
    .line 197
    if-lez v4, :cond_8

    .line 198
    .line 199
    iget v5, v1, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 200
    .line 201
    if-lez v5, :cond_8

    .line 202
    .line 203
    move v3, v4

    .line 204
    move v4, v5

    .line 205
    goto :goto_5

    .line 206
    :cond_8
    move v4, v3

    .line 207
    move v3, v0

    .line 208
    :goto_5
    const/4 v0, 0x2

    .line 209
    new-array v0, v0, [I

    .line 210
    .line 211
    iget-object v5, v15, Lcom/android/launcher3/Workspace;->C:[F

    .line 212
    .line 213
    aget v6, v5, v8

    .line 214
    .line 215
    float-to-int v6, v6

    .line 216
    aget v5, v5, v9

    .line 217
    .line 218
    float-to-int v5, v5

    .line 219
    move v2, v5

    .line 220
    iget v5, v12, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 221
    .line 222
    move-object/from16 v16, v1

    .line 223
    .line 224
    move v1, v6

    .line 225
    iget v6, v12, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 226
    .line 227
    move/from16 v17, v8

    .line 228
    .line 229
    iget-object v8, v15, Lcom/android/launcher3/Workspace;->r:[I

    .line 230
    .line 231
    move-object/from16 v18, v10

    .line 232
    .line 233
    const/4 v10, 0x3

    .line 234
    move-object/from16 v19, v7

    .line 235
    .line 236
    const/4 v7, 0x0

    .line 237
    move-object/from16 v11, v16

    .line 238
    .line 239
    move-object/from16 v20, v19

    .line 240
    .line 241
    move/from16 v16, v9

    .line 242
    .line 243
    move-object v9, v0

    .line 244
    move-object/from16 v0, p2

    .line 245
    .line 246
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/CellLayout;->n0(IIIIIILandroid/view/View;[I[II)[I

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    iput-object v1, v15, Lcom/android/launcher3/Workspace;->r:[I

    .line 251
    .line 252
    aget v0, v9, v17

    .line 253
    .line 254
    iget v1, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 255
    .line 256
    if-ne v0, v1, :cond_a

    .line 257
    .line 258
    aget v1, v9, v16

    .line 259
    .line 260
    iget v2, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 261
    .line 262
    if-eq v1, v2, :cond_9

    .line 263
    .line 264
    goto :goto_6

    .line 265
    :cond_9
    move/from16 v8, v17

    .line 266
    .line 267
    goto :goto_7

    .line 268
    :cond_a
    :goto_6
    move/from16 v8, v16

    .line 269
    .line 270
    :goto_7
    iput v0, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 271
    .line 272
    aget v0, v9, v16

    .line 273
    .line 274
    iput v0, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 275
    .line 276
    goto :goto_8

    .line 277
    :cond_b
    move-object v11, v1

    .line 278
    move-object/from16 v20, v7

    .line 279
    .line 280
    move/from16 v17, v8

    .line 281
    .line 282
    move/from16 v16, v9

    .line 283
    .line 284
    move-object/from16 v18, v10

    .line 285
    .line 286
    :goto_8
    new-instance v4, Lcom/android/launcher3/Workspace$h;

    .line 287
    .line 288
    move-object/from16 v6, p3

    .line 289
    .line 290
    move-object v0, v4

    .line 291
    move-object v5, v11

    .line 292
    move v3, v13

    .line 293
    move v4, v14

    .line 294
    move-object v1, v15

    .line 295
    move-object/from16 v2, v18

    .line 296
    .line 297
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/Workspace$h;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/W4;IILcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;)V

    .line 298
    .line 299
    .line 300
    move-object v4, v0

    .line 301
    move-object v0, v1

    .line 302
    move-object v7, v6

    .line 303
    iget v1, v2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 304
    .line 305
    const/4 v3, 0x4

    .line 306
    if-eq v1, v3, :cond_d

    .line 307
    .line 308
    const/4 v3, 0x5

    .line 309
    if-ne v1, v3, :cond_c

    .line 310
    .line 311
    goto :goto_9

    .line 312
    :cond_c
    move/from16 v1, v17

    .line 313
    .line 314
    goto :goto_a

    .line 315
    :cond_d
    :goto_9
    move/from16 v1, v16

    .line 316
    .line 317
    :goto_a
    if-eqz v1, :cond_e

    .line 318
    .line 319
    move-object v10, v2

    .line 320
    check-cast v10, Lcom/android/launcher3/widget/z0;

    .line 321
    .line 322
    iget-object v3, v10, Lcom/android/launcher3/widget/z0;->o:Landroid/appwidget/AppWidgetHostView;

    .line 323
    .line 324
    :goto_b
    move-object v6, v3

    .line 325
    goto :goto_c

    .line 326
    :cond_e
    const/4 v3, 0x0

    .line 327
    goto :goto_b

    .line 328
    :goto_c
    if-eqz v6, :cond_f

    .line 329
    .line 330
    if-eqz v8, :cond_f

    .line 331
    .line 332
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 333
    .line 334
    iget v8, v5, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 335
    .line 336
    iget v5, v5, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 337
    .line 338
    invoke-static {v6, v3, v8, v5}, Lr2/b;->i(Landroid/appwidget/AppWidgetHostView;Landroid/content/Context;II)V

    .line 339
    .line 340
    .line 341
    :cond_f
    if-eqz v1, :cond_10

    .line 342
    .line 343
    move-object v10, v2

    .line 344
    check-cast v10, Lcom/android/launcher3/widget/z0;

    .line 345
    .line 346
    iget-object v3, v10, Lcom/android/launcher3/widget/z0;->n:Lcom/android/launcher3/widget/U;

    .line 347
    .line 348
    if-eqz v3, :cond_10

    .line 349
    .line 350
    invoke-virtual {v10}, Lcom/android/launcher3/widget/z0;->Q()Lcom/android/launcher3/widget/N0;

    .line 351
    .line 352
    .line 353
    move-result-object v3

    .line 354
    invoke-virtual {v3}, Lcom/android/launcher3/widget/N0;->b()Z

    .line 355
    .line 356
    .line 357
    move-result v3

    .line 358
    if-eqz v3, :cond_10

    .line 359
    .line 360
    move/from16 v5, v16

    .line 361
    .line 362
    goto :goto_d

    .line 363
    :cond_10
    move/from16 v5, v17

    .line 364
    .line 365
    :goto_d
    if-eqz v1, :cond_19

    .line 366
    .line 367
    move-object v10, v2

    .line 368
    check-cast v10, Lcom/android/launcher3/widget/z0;

    .line 369
    .line 370
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 371
    .line 372
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 381
    .line 382
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 383
    .line 384
    .line 385
    move-result-object v3

    .line 386
    invoke-virtual {v1, v2, v3, v10}, Lx1/Z;->i(Landroid/content/Context;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;)Z

    .line 387
    .line 388
    .line 389
    move-result v1

    .line 390
    if-eqz v1, :cond_19

    .line 391
    .line 392
    iget-object v1, v7, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 393
    .line 394
    if-eqz v1, :cond_11

    .line 395
    .line 396
    invoke-virtual {v1}, Lcom/android/launcher3/dragndrop/v;->D()V

    .line 397
    .line 398
    .line 399
    :cond_11
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 400
    .line 401
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->l0:Z

    .line 410
    .line 411
    if-eqz v1, :cond_13

    .line 412
    .line 413
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    invoke-virtual {v10}, Lcom/android/launcher3/W4;->getTargetComponent()Landroid/content/ComponentName;

    .line 418
    .line 419
    .line 420
    move-result-object v2

    .line 421
    invoke-virtual {v1, v2}, Lcom/android/launcher3/H5;->B0(Landroid/content/ComponentName;)Z

    .line 422
    .line 423
    .line 424
    move-result v1

    .line 425
    if-eqz v1, :cond_13

    .line 426
    .line 427
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 428
    .line 429
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 430
    .line 431
    .line 432
    move-result-object v2

    .line 433
    const v3, 0x7f14004c

    .line 434
    .line 435
    .line 436
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    move/from16 v3, v17

    .line 441
    .line 442
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 443
    .line 444
    .line 445
    move-result-object v1

    .line 446
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 447
    .line 448
    .line 449
    invoke-virtual/range {p2 .. p2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 454
    .line 455
    .line 456
    move-result v1

    .line 457
    if-nez v1, :cond_12

    .line 458
    .line 459
    new-instance v1, Lcom/android/launcher3/m6;

    .line 460
    .line 461
    invoke-direct {v1, v0}, Lcom/android/launcher3/m6;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 462
    .line 463
    .line 464
    invoke-virtual {v0, v3, v3, v1}, Lcom/android/launcher3/Workspace;->G2(IZLjava/lang/Runnable;)V

    .line 465
    .line 466
    .line 467
    :cond_12
    iget-object v1, v7, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 468
    .line 469
    if-eqz v1, :cond_20

    .line 470
    .line 471
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 472
    .line 473
    invoke-virtual {v0, v1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 474
    .line 475
    .line 476
    return-void

    .line 477
    :cond_13
    invoke-static {}, Lx1/O;->p0()Z

    .line 478
    .line 479
    .line 480
    move-result v1

    .line 481
    if-eqz v1, :cond_15

    .line 482
    .line 483
    const-string v1, "onDropExternal, in monkey, do not create repeat widget."

    .line 484
    .line 485
    move-object/from16 v11, v20

    .line 486
    .line 487
    invoke-static {v11, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    .line 489
    .line 490
    invoke-virtual/range {p2 .. p2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 495
    .line 496
    .line 497
    move-result v1

    .line 498
    if-nez v1, :cond_14

    .line 499
    .line 500
    new-instance v1, Lcom/android/launcher3/o6;

    .line 501
    .line 502
    invoke-direct {v1, v0}, Lcom/android/launcher3/o6;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 503
    .line 504
    .line 505
    const/4 v3, 0x0

    .line 506
    invoke-virtual {v0, v3, v3, v1}, Lcom/android/launcher3/Workspace;->G2(IZLjava/lang/Runnable;)V

    .line 507
    .line 508
    .line 509
    :cond_14
    iget-object v1, v7, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 510
    .line 511
    if-eqz v1, :cond_20

    .line 512
    .line 513
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 514
    .line 515
    invoke-virtual {v0, v1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 516
    .line 517
    .line 518
    return-void

    .line 519
    :cond_15
    move-object/from16 v11, v20

    .line 520
    .line 521
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 522
    .line 523
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 528
    .line 529
    .line 530
    move-result-object v1

    .line 531
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 532
    .line 533
    .line 534
    move-result-object v1

    .line 535
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 536
    .line 537
    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    .line 538
    .line 539
    .line 540
    move-result-object v2

    .line 541
    invoke-virtual {v1, v2}, Lcom/android/launcher3/H5;->s(Ljava/lang/String;)I

    .line 542
    .line 543
    .line 544
    move-result v1

    .line 545
    move/from16 v2, v16

    .line 546
    .line 547
    if-ne v1, v2, :cond_16

    .line 548
    .line 549
    const/4 v8, 0x1

    .line 550
    goto :goto_e

    .line 551
    :cond_16
    const/4 v8, 0x0

    .line 552
    :goto_e
    if-eqz v8, :cond_17

    .line 553
    .line 554
    const-string v1, "launcher is allowed alert"

    .line 555
    .line 556
    goto :goto_f

    .line 557
    :cond_17
    const-string v1, "launcher is not  allowed alert"

    .line 558
    .line 559
    :goto_f
    new-instance v2, Ljava/lang/StringBuilder;

    .line 560
    .line 561
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 562
    .line 563
    .line 564
    const-string v3, "onDropExternal--text="

    .line 565
    .line 566
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    .line 568
    .line 569
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 570
    .line 571
    .line 572
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    invoke-static {v11, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 577
    .line 578
    .line 579
    iget-object v3, v7, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 580
    .line 581
    if-eqz v8, :cond_18

    .line 582
    .line 583
    invoke-static {}, Lx1/h0;->g()Lx1/h0;

    .line 584
    .line 585
    .line 586
    move-result-object v8

    .line 587
    iget-object v9, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 588
    .line 589
    new-instance v0, Lcom/android/launcher3/Workspace$i;

    .line 590
    .line 591
    move-object/from16 v1, p0

    .line 592
    .line 593
    move-object v7, v6

    .line 594
    move-object v2, v12

    .line 595
    move v6, v5

    .line 596
    move-object v5, v4

    .line 597
    move-object v4, v3

    .line 598
    move-object/from16 v3, p2

    .line 599
    .line 600
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/Workspace$i;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/v;Ljava/lang/Runnable;ILandroid/appwidget/AppWidgetHostView;)V

    .line 601
    .line 602
    .line 603
    invoke-virtual {v8, v9, v0}, Lx1/h0;->f(Lcom/android/launcher3/C2;Lx1/h0$a;)V

    .line 604
    .line 605
    .line 606
    return-void

    .line 607
    :cond_18
    move-object v1, v12

    .line 608
    const/4 v7, 0x1

    .line 609
    move-object/from16 v0, p0

    .line 610
    .line 611
    move-object/from16 v2, p2

    .line 612
    .line 613
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/Workspace;->D0(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/v;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 614
    .line 615
    .line 616
    return-void

    .line 617
    :cond_19
    move-object v1, v12

    .line 618
    iget-object v3, v7, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 619
    .line 620
    const/4 v7, 0x1

    .line 621
    move-object/from16 v0, p0

    .line 622
    .line 623
    move-object/from16 v2, p2

    .line 624
    .line 625
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/Workspace;->D0(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/v;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 626
    .line 627
    .line 628
    return-void

    .line 629
    :cond_1a
    move-object v1, v11

    .line 630
    move-object v11, v7

    .line 631
    move-object v7, v1

    .line 632
    move-object v1, v12

    .line 633
    move v8, v13

    .line 634
    move v12, v14

    .line 635
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 636
    .line 637
    sget-object v6, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 638
    .line 639
    invoke-interface {v5, v6}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 640
    .line 641
    .line 642
    move-result v5

    .line 643
    if-nez v5, :cond_1b

    .line 644
    .line 645
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 646
    .line 647
    sget-object v6, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 648
    .line 649
    invoke-interface {v5, v6}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 650
    .line 651
    .line 652
    move-result v5

    .line 653
    if-eqz v5, :cond_1c

    .line 654
    .line 655
    :cond_1b
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 656
    .line 657
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 658
    .line 659
    .line 660
    move-result-object v5

    .line 661
    sget-object v6, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 662
    .line 663
    const-wide/16 v9, 0x1f4

    .line 664
    .line 665
    invoke-virtual {v5, v6, v9, v10}, Lcom/android/launcher3/statemanager/d;->I(Lcom/android/launcher3/statemanager/a;J)V

    .line 666
    .line 667
    .line 668
    :cond_1c
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 669
    .line 670
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->b()Lcom/android/launcher3/util/B0;

    .line 671
    .line 672
    .line 673
    move-result-object v5

    .line 674
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 675
    .line 676
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 677
    .line 678
    .line 679
    move-result-object v6

    .line 680
    invoke-virtual {v5, v1, v6, v2}, Lcom/android/launcher3/util/B0;->d(Lcom/android/launcher3/model/data/y;Lz1/J3;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 681
    .line 682
    .line 683
    move-result-object v9

    .line 684
    if-nez v9, :cond_1d

    .line 685
    .line 686
    const-string v0, "onDropExternal: view is null, return!"

    .line 687
    .line 688
    invoke-static {v11, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    .line 690
    .line 691
    return-void

    .line 692
    :cond_1d
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 693
    .line 694
    .line 695
    move-result-object v1

    .line 696
    move-object v13, v1

    .line 697
    check-cast v13, Lcom/android/launcher3/model/data/y;

    .line 698
    .line 699
    iput-object v13, v7, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 700
    .line 701
    if-eqz p1, :cond_21

    .line 702
    .line 703
    const/16 v17, 0x0

    .line 704
    .line 705
    aget v1, p1, v17

    .line 706
    .line 707
    const/16 v16, 0x1

    .line 708
    .line 709
    aget v2, p1, v16

    .line 710
    .line 711
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 712
    .line 713
    move-object/from16 v5, p2

    .line 714
    .line 715
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/Workspace;->a1(IIIILcom/android/launcher3/CellLayout;[I)[I

    .line 716
    .line 717
    .line 718
    move-result-object v1

    .line 719
    move-object v2, v5

    .line 720
    iput-object v1, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 721
    .line 722
    iget-boolean v3, v0, Lcom/android/launcher3/Workspace;->r0:Z

    .line 723
    .line 724
    if-eqz v3, :cond_1e

    .line 725
    .line 726
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 727
    .line 728
    aget v4, v3, v17

    .line 729
    .line 730
    aget v3, v3, v16

    .line 731
    .line 732
    invoke-virtual {v2, v4, v3, v1}, Lcom/android/launcher3/CellLayout;->K(FF[I)F

    .line 733
    .line 734
    .line 735
    move-result v1

    .line 736
    :goto_10
    move v4, v1

    .line 737
    goto :goto_11

    .line 738
    :cond_1e
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 739
    .line 740
    invoke-direct {v0, v1, v3, v2}, Lcom/android/launcher3/Workspace;->d1([I[FLcom/android/launcher3/CellLayout;)F

    .line 741
    .line 742
    .line 743
    move-result v1

    .line 744
    goto :goto_10

    .line 745
    :goto_11
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 746
    .line 747
    const/4 v6, 0x1

    .line 748
    move-object v3, v2

    .line 749
    move v5, v4

    .line 750
    move v2, v8

    .line 751
    move-object v4, v1

    .line 752
    move-object v1, v9

    .line 753
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/Workspace;->R0(Landroid/view/View;ILcom/android/launcher3/CellLayout;[IFZLcom/android/launcher3/n0$a;)Z

    .line 754
    .line 755
    .line 756
    move-result v4

    .line 757
    move v14, v2

    .line 758
    if-eqz v4, :cond_1f

    .line 759
    .line 760
    goto :goto_12

    .line 761
    :cond_1f
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 762
    .line 763
    const/4 v6, 0x1

    .line 764
    move-object/from16 v2, p2

    .line 765
    .line 766
    move v4, v5

    .line 767
    move-object/from16 v5, p3

    .line 768
    .line 769
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/Workspace;->C0(Landroid/view/View;Lcom/android/launcher3/CellLayout;[IFLcom/android/launcher3/n0$a;Z)Z

    .line 770
    .line 771
    .line 772
    move-result v3

    .line 773
    move-object/from16 v18, v1

    .line 774
    .line 775
    if-eqz v3, :cond_22

    .line 776
    .line 777
    :cond_20
    :goto_12
    return-void

    .line 778
    :cond_21
    move v14, v8

    .line 779
    move-object/from16 v18, v9

    .line 780
    .line 781
    :cond_22
    if-eqz p1, :cond_23

    .line 782
    .line 783
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 784
    .line 785
    const/16 v17, 0x0

    .line 786
    .line 787
    aget v2, v1, v17

    .line 788
    .line 789
    float-to-int v2, v2

    .line 790
    const/16 v16, 0x1

    .line 791
    .line 792
    aget v1, v1, v16

    .line 793
    .line 794
    float-to-int v1, v1

    .line 795
    iget-object v8, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 796
    .line 797
    const/4 v9, 0x0

    .line 798
    const/4 v10, 0x3

    .line 799
    const/4 v3, 0x1

    .line 800
    const/4 v4, 0x1

    .line 801
    const/4 v5, 0x1

    .line 802
    const/4 v6, 0x1

    .line 803
    const/4 v7, 0x0

    .line 804
    move v15, v2

    .line 805
    move v2, v1

    .line 806
    move v1, v15

    .line 807
    move-object v15, v0

    .line 808
    move/from16 v20, v12

    .line 809
    .line 810
    move-object/from16 v0, p2

    .line 811
    .line 812
    move-object/from16 v12, p3

    .line 813
    .line 814
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/CellLayout;->n0(IIIIIILandroid/view/View;[I[II)[I

    .line 815
    .line 816
    .line 817
    move-result-object v1

    .line 818
    iput-object v1, v15, Lcom/android/launcher3/Workspace;->r:[I

    .line 819
    .line 820
    const/4 v2, 0x1

    .line 821
    goto :goto_13

    .line 822
    :cond_23
    move-object v15, v0

    .line 823
    move/from16 v20, v12

    .line 824
    .line 825
    move-object/from16 v0, p2

    .line 826
    .line 827
    move-object/from16 v12, p3

    .line 828
    .line 829
    iget-object v1, v15, Lcom/android/launcher3/Workspace;->r:[I

    .line 830
    .line 831
    const/4 v2, 0x1

    .line 832
    invoke-virtual {v0, v1, v2, v2}, Lcom/android/launcher3/CellLayout;->E([III)Z

    .line 833
    .line 834
    .line 835
    :goto_13
    iget-object v1, v15, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 836
    .line 837
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 838
    .line 839
    .line 840
    move-result-object v5

    .line 841
    iget-object v1, v15, Lcom/android/launcher3/Workspace;->r:[I

    .line 842
    .line 843
    const/16 v17, 0x0

    .line 844
    .line 845
    aget v9, v1, v17

    .line 846
    .line 847
    aget v10, v1, v2

    .line 848
    .line 849
    move-object v6, v13

    .line 850
    move v7, v14

    .line 851
    move/from16 v8, v20

    .line 852
    .line 853
    invoke-virtual/range {v5 .. v10}, Lz1/J3;->x(Lcom/android/launcher3/model/data/y;IIII)V

    .line 854
    .line 855
    .line 856
    move v2, v7

    .line 857
    move v3, v8

    .line 858
    iget-object v1, v12, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 859
    .line 860
    instance-of v4, v1, Lcom/android/launcher3/dragndrop/K;

    .line 861
    .line 862
    if-eqz v4, :cond_24

    .line 863
    .line 864
    iget v4, v6, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 865
    .line 866
    const/4 v5, 0x6

    .line 867
    if-ne v4, v5, :cond_24

    .line 868
    .line 869
    check-cast v1, Lcom/android/launcher3/dragndrop/K;

    .line 870
    .line 871
    invoke-virtual {v1}, Lcom/android/launcher3/dragndrop/K;->m()Landroid/content/pm/ShortcutInfo;

    .line 872
    .line 873
    .line 874
    move-result-object v1

    .line 875
    new-instance v4, Ljava/lang/StringBuilder;

    .line 876
    .line 877
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 878
    .line 879
    .line 880
    const-string v5, "onDropExternal add shortcut from other app by drag, shortcutInfo="

    .line 881
    .line 882
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 883
    .line 884
    .line 885
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 886
    .line 887
    .line 888
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 889
    .line 890
    .line 891
    move-result-object v4

    .line 892
    invoke-static {v11, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 893
    .line 894
    .line 895
    if-eqz v1, :cond_24

    .line 896
    .line 897
    sget-object v4, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 898
    .line 899
    iget-object v5, v15, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 900
    .line 901
    invoke-virtual {v4, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 902
    .line 903
    .line 904
    move-result-object v4

    .line 905
    check-cast v4, Lz1/t1;

    .line 906
    .line 907
    const/4 v5, 0x1

    .line 908
    invoke-virtual {v4, v1, v5}, Lz1/t1;->y(Landroid/content/pm/ShortcutInfo;Z)V

    .line 909
    .line 910
    .line 911
    goto :goto_14

    .line 912
    :cond_24
    const/4 v5, 0x1

    .line 913
    :goto_14
    iget-object v1, v15, Lcom/android/launcher3/Workspace;->r:[I

    .line 914
    .line 915
    const/16 v17, 0x0

    .line 916
    .line 917
    aget v4, v1, v17

    .line 918
    .line 919
    aget v5, v1, v5

    .line 920
    .line 921
    iget v1, v6, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 922
    .line 923
    iget v7, v6, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 924
    .line 925
    move-object v8, v0

    .line 926
    move v6, v1

    .line 927
    move-object v0, v15

    .line 928
    move-object/from16 v1, v18

    .line 929
    .line 930
    invoke-interface/range {v0 .. v7}, Lcom/android/launcher3/M6;->q(Landroid/view/View;IIIIII)V

    .line 931
    .line 932
    .line 933
    invoke-virtual {v8, v1}, Lcom/android/launcher3/CellLayout;->l0(Landroid/view/View;)V

    .line 934
    .line 935
    .line 936
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 937
    .line 938
    .line 939
    move-result-object v2

    .line 940
    invoke-virtual {v2, v1}, Lcom/android/launcher3/K5;->n(Landroid/view/View;)V

    .line 941
    .line 942
    .line 943
    iget-object v2, v12, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 944
    .line 945
    if-eqz v2, :cond_25

    .line 946
    .line 947
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->V2()V

    .line 948
    .line 949
    .line 950
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 951
    .line 952
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 953
    .line 954
    .line 955
    move-result-object v2

    .line 956
    iget-object v3, v12, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 957
    .line 958
    invoke-virtual {v2, v3, v1, v0}, Lcom/android/launcher3/dragndrop/DragLayer;->i(Lcom/android/launcher3/dragndrop/v;Landroid/view/View;Landroid/view/View;)V

    .line 959
    .line 960
    .line 961
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->Q2()V

    .line 962
    .line 963
    .line 964
    :cond_25
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->k0:Lcom/android/launcher3/logging/StatsLogManager;

    .line 965
    .line 966
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 967
    .line 968
    .line 969
    move-result-object v0

    .line 970
    iget-object v1, v12, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 971
    .line 972
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 973
    .line 974
    .line 975
    move-result-object v0

    .line 976
    iget-object v1, v12, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 977
    .line 978
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 979
    .line 980
    .line 981
    move-result-object v0

    .line 982
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->p:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 983
    .line 984
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 985
    .line 986
    .line 987
    return-void
.end method

.method static bridge synthetic v0(Lcom/android/launcher3/Workspace;)Ln1/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic w0(Lcom/android/launcher3/Workspace;)Lcom/android/launcher3/logging/StatsLogManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->k0:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    return-object p0
.end method

.method private w2(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_9

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-le v0, v1, :cond_9

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_9

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    and-int/lit16 v0, v0, 0xff

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    if-eq v0, v2, :cond_8

    .line 32
    .line 33
    const/4 v2, 0x5

    .line 34
    if-eq v0, v2, :cond_0

    .line 35
    .line 36
    goto/16 :goto_3

    .line 37
    .line 38
    :cond_0
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    iput v0, p0, Lcom/android/launcher3/Workspace;->R:F

    .line 47
    .line 48
    iput v2, p0, Lcom/android/launcher3/Workspace;->S:F

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->initDownIfNeeded(Landroid/view/MotionEvent;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lx1/O;->Q1()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_5

    .line 58
    .line 59
    iget-boolean p1, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 60
    .line 61
    if-eqz p1, :cond_5

    .line 62
    .line 63
    iget-object p1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getFinalX()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    sub-int/2addr p1, v0

    .line 76
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_2

    .line 87
    .line 88
    iget v0, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 89
    .line 90
    div-int/lit8 v0, v0, 0x3

    .line 91
    .line 92
    if-ge p1, v0, :cond_1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->interruptScroll()V

    .line 96
    .line 97
    .line 98
    :cond_2
    :goto_0
    invoke-static {}, Lx1/O;->K3()Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_4

    .line 103
    .line 104
    iget-object p1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/android/launcher3/L5;->k()I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    iget-object v0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->h()F

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    float-to-int v0, v0

    .line 117
    sub-int/2addr p1, v0

    .line 118
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iget-object v0, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/android/launcher3/L5;->l()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_4

    .line 129
    .line 130
    iget v0, p0, Lcom/android/launcher3/V4;->mPageSlop:I

    .line 131
    .line 132
    div-int/lit8 v0, v0, 0x3

    .line 133
    .line 134
    if-ge p1, v0, :cond_3

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/T6;->g:Lcom/android/launcher3/L5;

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/android/launcher3/L5;->abortAnimation()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->interruptScroll()V

    .line 143
    .line 144
    .line 145
    :cond_4
    :goto_1
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mDownWithBeingDragged:Z

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->pageBeginTransition()V

    .line 148
    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getFinalX()I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 158
    .line 159
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    sub-int/2addr p1, v0

    .line 164
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 169
    .line 170
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-nez v0, :cond_6

    .line 175
    .line 176
    iget v0, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    .line 177
    .line 178
    div-int/lit8 v0, v0, 0x3

    .line 179
    .line 180
    if-ge p1, v0, :cond_7

    .line 181
    .line 182
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 183
    .line 184
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-nez p1, :cond_7

    .line 189
    .line 190
    iget-boolean p1, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 191
    .line 192
    if-nez p1, :cond_7

    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->pageEndTransition()V

    .line 202
    .line 203
    .line 204
    :cond_7
    :goto_2
    iget-object p0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 205
    .line 206
    if-eqz p0, :cond_9

    .line 207
    .line 208
    invoke-virtual {p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->r()V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-le v0, v1, :cond_9

    .line 217
    .line 218
    iget v0, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 219
    .line 220
    const/4 v1, -0x1

    .line 221
    if-eq v0, v1, :cond_9

    .line 222
    .line 223
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->determineScrollingStart(Landroid/view/MotionEvent;)V

    .line 224
    .line 225
    .line 226
    :cond_9
    :goto_3
    return-void
.end method

.method private w3()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->E:Z

    .line 8
    .line 9
    if-nez v0, :cond_4

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    div-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    add-int/2addr v0, v1

    .line 22
    const/4 v1, 0x0

    .line 23
    move v2, v1

    .line 24
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-ge v2, v3, :cond_4

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 35
    .line 36
    if-eqz v3, :cond_3

    .line 37
    .line 38
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 39
    .line 40
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v4}, Lx1/Z;->d()Landroid/util/Pair;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iget-object v4, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v4, Ljava/lang/Integer;

    .line 51
    .line 52
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    iget-object v5, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 57
    .line 58
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-virtual {v5}, Lcom/android/launcher3/h0;->T0()Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_0

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getCurEffect()Lcom/android/launcher3/M5;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    if-eqz v5, :cond_0

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getCurEffect()Lcom/android/launcher3/M5;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-virtual {v5}, Lcom/android/launcher3/M5;->a()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    const/4 v6, -0x1

    .line 83
    if-eq v5, v6, :cond_0

    .line 84
    .line 85
    if-ne v4, v2, :cond_0

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getCurEffect()Lcom/android/launcher3/M5;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-virtual {v5}, Lcom/android/launcher3/M5;->a()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eq v5, v4, :cond_0

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-eq v5, v4, :cond_0

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getCurEffect()Lcom/android/launcher3/M5;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v4}, Lcom/android/launcher3/M5;->a()I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    invoke-virtual {p0, v0, v3, v4}, Lcom/android/launcher3/V4;->getScrollProgress(ILandroid/view/View;I)F

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    goto :goto_1

    .line 116
    :cond_0
    invoke-virtual {p0, v0, v3, v2}, Lcom/android/launcher3/V4;->getScrollProgress(ILandroid/view/View;I)F

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    :goto_1
    const/high16 v5, 0x3f800000    # 1.0f

    .line 121
    .line 122
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    sub-float/2addr v5, v4

    .line 127
    iget-boolean v4, p0, Lcom/android/launcher3/Workspace;->I:Z

    .line 128
    .line 129
    if-eqz v4, :cond_1

    .line 130
    .line 131
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 136
    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_1
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    const/4 v4, 0x0

    .line 144
    cmpl-float v4, v5, v4

    .line 145
    .line 146
    if-lez v4, :cond_2

    .line 147
    .line 148
    move v4, v1

    .line 149
    goto :goto_2

    .line 150
    :cond_2
    const/4 v4, 0x4

    .line 151
    :goto_2
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 152
    .line 153
    .line 154
    :cond_3
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :cond_4
    return-void
.end method

.method static bridge synthetic x0(Lcom/android/launcher3/Workspace;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/Workspace;->e0:F

    .line 2
    .line 3
    return-void
.end method

.method private x3()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    div-int/lit8 v1, v1, 0x2

    .line 10
    .line 11
    add-int/2addr v0, v1

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v1, v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, v0, v2, v1}, Lcom/android/launcher3/V4;->getScrollProgress(ILandroid/view/View;I)F

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {v2, v3}, Lcom/android/launcher3/CellLayout;->setScrollProgress(F)V

    .line 32
    .line 33
    .line 34
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-void
.end method

.method static bridge synthetic y0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/Workspace;->A2(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private z0(Lcom/android/launcher3/n0$a;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->m:Lcom/android/launcher3/K5;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J1()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->m:Lcom/android/launcher3/K5;

    .line 18
    .line 19
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    instance-of v3, v3, Lcom/android/launcher3/Hotseat;

    .line 24
    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getCellPosMapper()Lc1/c;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iget-object v4, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget v3, v3, Lc1/c$a;->c:I

    .line 38
    .line 39
    invoke-virtual {p0, v3}, Lcom/android/launcher3/Workspace;->k1(I)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 44
    .line 45
    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    add-int/2addr v0, v3

    .line 60
    :cond_0
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->getContentView()Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    instance-of p1, p1, Lcom/android/launcher3/widget/T;

    .line 67
    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    :cond_1
    if-ne v0, v1, :cond_2

    .line 73
    .line 74
    move p1, v1

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    move p1, v2

    .line 77
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->m:Lcom/android/launcher3/K5;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 84
    .line 85
    sget-object v3, Lf1/a;->c:Lf1/a$a;

    .line 86
    .line 87
    invoke-virtual {v3}, Lf1/a$a;->c()Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-nez v3, :cond_3

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getLeftmostVisiblePageForIndex(I)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    sub-int/2addr v3, v1

    .line 106
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->getLeftmostVisiblePageForIndex(I)I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-ne v0, v3, :cond_3

    .line 111
    .line 112
    move v0, v1

    .line 113
    goto :goto_1

    .line 114
    :cond_3
    move v0, v2

    .line 115
    goto :goto_1

    .line 116
    :cond_4
    move p1, v2

    .line 117
    move v0, p1

    .line 118
    :goto_1
    if-eqz p1, :cond_5

    .line 119
    .line 120
    if-eqz v0, :cond_5

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 124
    .line 125
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-nez p1, :cond_6

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 133
    .line 134
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 139
    .line 140
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-ne p1, v1, :cond_7

    .line 149
    .line 150
    if-nez v0, :cond_7

    .line 151
    .line 152
    :goto_2
    return-void

    .line 153
    :cond_7
    new-instance p1, Lcom/android/launcher3/l6;

    .line 154
    .line 155
    invoke-direct {p1, p0}, Lcom/android/launcher3/l6;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 156
    .line 157
    .line 158
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->b1(Ljava/util/function/Consumer;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method


# virtual methods
.method public A0()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/y6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/y6;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/Workspace;->b1(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public A1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/Workspace;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public B0(Lz2/a$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->h0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget p0, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 7
    .line 8
    invoke-interface {p1, p0}, Lz2/a$b;->a(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public B2(Ljava/util/function/Predicate;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1, p2}, Lz1/J3;->D(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->I2(Ljava/util/function/Predicate;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method C0(Landroid/view/View;Lcom/android/launcher3/CellLayout;[IFLcom/android/launcher3/n0$a;Z)Z
    .locals 3

    .line 1
    invoke-virtual {p2, p3}, Lcom/android/launcher3/CellLayout;->L([I)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    cmpl-float p1, p4, p1

    .line 6
    .line 7
    const/4 p4, 0x0

    .line 8
    if-lez p1, :cond_0

    .line 9
    .line 10
    return p4

    .line 11
    :cond_0
    iget-object p1, p5, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    iget v0, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 14
    .line 15
    const-string v1, "Launcher.Workspace"

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    if-ne v0, v2, :cond_7

    .line 19
    .line 20
    iget p1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 21
    .line 22
    if-eq p1, v2, :cond_1

    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_1
    const-string p1, "addToExistingFolderIfNecessary"

    .line 27
    .line 28
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    aget p1, p3, p4

    .line 32
    .line 33
    aget p3, p3, v2

    .line 34
    .line 35
    invoke-virtual {p2, p1, p3}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-boolean p2, p0, Lcom/android/launcher3/Workspace;->Q:Z

    .line 40
    .line 41
    if-nez p2, :cond_2

    .line 42
    .line 43
    return p4

    .line 44
    :cond_2
    iput-boolean p4, p0, Lcom/android/launcher3/Workspace;->Q:Z

    .line 45
    .line 46
    instance-of p2, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 47
    .line 48
    if-eqz p2, :cond_6

    .line 49
    .line 50
    check-cast p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 51
    .line 52
    iget-object p2, p5, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->o(Lcom/android/launcher3/model/data/y;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_6

    .line 59
    .line 60
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->k0:Lcom/android/launcher3/logging/StatsLogManager;

    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iget-object p3, p1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 67
    .line 68
    invoke-interface {p2, p3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    iget-object p3, p5, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 73
    .line 74
    invoke-interface {p2, p3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    sget-object p3, Lcom/android/launcher3/logging/StatsLogManager$e;->q:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 79
    .line 80
    invoke-interface {p2, p3}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 84
    .line 85
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p2}, Lcom/android/launcher3/G4;->q()Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-eqz p2, :cond_3

    .line 94
    .line 95
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 96
    .line 97
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-virtual {p2, p5, p1}, Lcom/android/launcher3/menu/c;->c(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/folder/FolderIcon;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_3
    invoke-virtual {p1, p5, p4}, Lcom/android/launcher3/folder/FolderIcon;->Y(Lcom/android/launcher3/n0$a;Z)V

    .line 106
    .line 107
    .line 108
    if-nez p6, :cond_4

    .line 109
    .line 110
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 111
    .line 112
    iget-object p2, p2, Lc1/a;->e:Landroid/view/View;

    .line 113
    .line 114
    invoke-virtual {p0, p2}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    iget-object p3, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 119
    .line 120
    iget-object p3, p3, Lc1/a;->e:Landroid/view/View;

    .line 121
    .line 122
    invoke-virtual {p2, p3}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    :cond_4
    :goto_0
    iget-object p2, p1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 126
    .line 127
    const/16 p3, 0x20

    .line 128
    .line 129
    invoke-virtual {p2, p3}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-eqz p2, :cond_5

    .line 134
    .line 135
    iget-object p2, p5, Lcom/android/launcher3/n0$a;->h:Lcom/android/launcher3/model/data/y;

    .line 136
    .line 137
    iget p2, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 138
    .line 139
    iget-object p1, p1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 140
    .line 141
    iget p1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 142
    .line 143
    if-eq p2, p1, :cond_5

    .line 144
    .line 145
    const-string p1, "addToExistingFolderIfNecessary addAppsToPrivateFolder "

    .line 146
    .line 147
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    .line 149
    .line 150
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 151
    .line 152
    iget-object p1, p5, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 153
    .line 154
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/h1;->L(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V

    .line 155
    .line 156
    .line 157
    :cond_5
    return v2

    .line 158
    :cond_6
    return p4

    .line 159
    :cond_7
    :goto_1
    const-string p0, "addToExistingFolderIfNecessary: icon span is not 1*1."

    .line 160
    .line 161
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    return p4
.end method

.method public C2(Ln1/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 2
    .line 3
    return-void
.end method

.method C3(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_1

    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lc1/b;

    .line 9
    .line 10
    iget-boolean v1, v0, Lc1/b;->e:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lc1/b;->c()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0}, Lc1/b;->a()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ne v1, v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lc1/b;->d()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0}, Lc1/b;->b()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eq v1, v0, :cond_1

    .line 33
    .line 34
    :cond_0
    return p0

    .line 35
    :cond_1
    instance-of v0, p2, Lcom/android/launcher3/folder/FolderIcon;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    move-object v0, p2

    .line 40
    check-cast v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 41
    .line 42
    instance-of p2, p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    return p0

    .line 47
    :cond_2
    invoke-virtual {v0, p1}, Lcom/android/launcher3/folder/FolderIcon;->o(Lcom/android/launcher3/model/data/y;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    :cond_3
    return p0
.end method

.method public D()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public D0(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/v;Ljava/lang/Runnable;ILandroid/view/View;Z)V
    .locals 13

    .line 1
    move/from16 v9, p5

    .line 2
    .line 3
    const/4 v11, 0x2

    .line 4
    new-array v1, v11, [I

    .line 5
    .line 6
    new-array v2, v11, [F

    .line 7
    .line 8
    instance-of v0, p1, Lcom/android/launcher3/widget/y0;

    .line 9
    .line 10
    const/4 v12, 0x1

    .line 11
    xor-int/lit8 v7, v0, 0x1

    .line 12
    .line 13
    iget-object v6, p0, Lcom/android/launcher3/Workspace;->r:[I

    .line 14
    .line 15
    move-object v0, p0

    .line 16
    move-object v5, p1

    .line 17
    move-object v4, p2

    .line 18
    move-object/from16 v3, p3

    .line 19
    .line 20
    move-object/from16 v8, p6

    .line 21
    .line 22
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/Workspace;->e1([I[FLcom/android/launcher3/dragndrop/v;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;[IZLandroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const v3, 0x7f0c002f

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getInteger(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    add-int/lit16 v0, v0, -0xc8

    .line 39
    .line 40
    iget v3, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 41
    .line 42
    const/4 v4, 0x4

    .line 43
    const/4 v6, 0x0

    .line 44
    if-eq v3, v4, :cond_1

    .line 45
    .line 46
    const/4 v7, 0x5

    .line 47
    if-ne v3, v7, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    move v3, v6

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    :goto_0
    move v3, v12

    .line 53
    :goto_1
    if-eq v9, v11, :cond_3

    .line 54
    .line 55
    if-eqz p7, :cond_2

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_2
    move-object/from16 v7, p3

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_3
    :goto_2
    if-eqz v8, :cond_2

    .line 62
    .line 63
    invoke-virtual/range {p3 .. p3}, Lcom/android/launcher3/dragndrop/v;->getContentView()Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    if-eq v7, v8, :cond_2

    .line 68
    .line 69
    instance-of v7, v8, Lcom/android/launcher3/widget/group/f;

    .line 70
    .line 71
    if-nez v7, :cond_2

    .line 72
    .line 73
    invoke-direct {p0, p1, v8}, Lcom/android/launcher3/Workspace;->S0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    int-to-float v5, v0

    .line 78
    const v7, 0x3f4ccccd    # 0.8f

    .line 79
    .line 80
    .line 81
    mul-float/2addr v5, v7

    .line 82
    float-to-int v5, v5

    .line 83
    move-object/from16 v7, p3

    .line 84
    .line 85
    invoke-virtual {v7, v3, v5}, Lcom/android/launcher3/dragndrop/v;->q(Landroid/graphics/drawable/Drawable;I)V

    .line 86
    .line 87
    .line 88
    goto :goto_4

    .line 89
    :goto_3
    if-eqz v3, :cond_4

    .line 90
    .line 91
    if-eqz p7, :cond_4

    .line 92
    .line 93
    aget v3, v2, v6

    .line 94
    .line 95
    aget v5, v2, v12

    .line 96
    .line 97
    invoke-static {v3, v5}, Ljava/lang/Math;->min(FF)F

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    aput v3, v2, v12

    .line 102
    .line 103
    aput v3, v2, v6

    .line 104
    .line 105
    :cond_4
    :goto_4
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 106
    .line 107
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    if-ne v9, v4, :cond_5

    .line 112
    .line 113
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 114
    .line 115
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    const v5, 0x3dcccccd    # 0.1f

    .line 120
    .line 121
    .line 122
    const/4 v6, 0x0

    .line 123
    const/4 v3, 0x0

    .line 124
    const v4, 0x3dcccccd    # 0.1f

    .line 125
    .line 126
    .line 127
    move v8, v0

    .line 128
    move-object v0, v2

    .line 129
    move-object v2, v1

    .line 130
    move-object v1, v7

    .line 131
    move-object/from16 v7, p4

    .line 132
    .line 133
    invoke-virtual/range {v0 .. v8}, Lcom/android/launcher3/dragndrop/DragLayer;->j(Lcom/android/launcher3/dragndrop/v;[IFFFILjava/lang/Runnable;I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_5
    if-ne v9, v12, :cond_6

    .line 138
    .line 139
    goto :goto_5

    .line 140
    :cond_6
    move v11, v6

    .line 141
    :goto_5
    new-instance v7, Lcom/android/launcher3/Workspace$j;

    .line 142
    .line 143
    move-object/from16 v0, p4

    .line 144
    .line 145
    invoke-direct {v7, p0, v8, v0}, Lcom/android/launcher3/Workspace$j;-><init>(Lcom/android/launcher3/Workspace;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->H()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_7

    .line 155
    .line 156
    move-object v0, v2

    .line 157
    aget v2, v1, v6

    .line 158
    .line 159
    aget v1, v1, v12

    .line 160
    .line 161
    aget v5, v0, v6

    .line 162
    .line 163
    aget v6, v0, v12

    .line 164
    .line 165
    const/4 v9, -0x1

    .line 166
    const/high16 v4, 0x3f800000    # 1.0f

    .line 167
    .line 168
    move-object v10, p0

    .line 169
    move-object v0, v3

    .line 170
    move v8, v11

    .line 171
    move v3, v1

    .line 172
    move-object/from16 v1, p3

    .line 173
    .line 174
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/dragndrop/DragLayer;->g(Lcom/android/launcher3/dragndrop/v;IIFFFLjava/lang/Runnable;IILandroid/view/View;)V

    .line 175
    .line 176
    .line 177
    :cond_7
    return-void
.end method

.method public D2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->U0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->T:Landroid/view/View;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/view/ViewGroup;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->T:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->H2()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->clear()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/android/launcher3/y0;->Z()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->G0()V

    .line 42
    .line 43
    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->enableLayoutTransitions()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getMfvPageIndicator()Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getMfvPageIndicator()Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->p()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->notifyLongClickTextViewWhenPageIndicatorCountChanged()V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method D3(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;[IF)Z
    .locals 1

    .line 1
    invoke-virtual {p2, p3}, Lcom/android/launcher3/CellLayout;->L([I)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    cmpl-float p4, p4, v0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-lez p4, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    aget p4, p3, v0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aget p3, p3, v0

    .line 15
    .line 16
    invoke-virtual {p2, p4, p3}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/Workspace;->C3(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public E0(Landroid/view/View;Lcom/android/launcher3/dragndrop/y;Lcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Ln1/d;Lcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v6, p4

    .line 6
    .line 7
    move-object/from16 v2, p5

    .line 8
    .line 9
    move-object/from16 v10, p6

    .line 10
    .line 11
    const-string v3, "Launcher.Workspace"

    .line 12
    .line 13
    if-eqz v6, :cond_0

    .line 14
    .line 15
    new-instance v4, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v5, "beginDragShared--dragObject.title: "

    .line 21
    .line 22
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v5, v6, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 26
    .line 27
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    :cond_0
    instance-of v4, v1, Lcom/android/launcher3/BubbleTextView;

    .line 38
    .line 39
    if-eqz v4, :cond_1

    .line 40
    .line 41
    move-object v4, v1

    .line 42
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 43
    .line 44
    invoke-virtual {v4}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    if-eqz v4, :cond_1

    .line 49
    .line 50
    invoke-virtual {v4}, Ls1/o;->d()F

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const/high16 v4, 0x3f800000    # 1.0f

    .line 56
    .line 57
    :goto_0
    invoke-static {}, Lx1/O;->k1()Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    const/4 v7, 0x0

    .line 62
    if-eqz v5, :cond_2

    .line 63
    .line 64
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 65
    .line 66
    iget-boolean v8, v5, Lcom/android/launcher3/C2;->r0:Z

    .line 67
    .line 68
    if-eqz v8, :cond_2

    .line 69
    .line 70
    iput-boolean v7, v5, Lcom/android/launcher3/C2;->r0:Z

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->clearFocus()V

    .line 74
    .line 75
    .line 76
    :goto_1
    invoke-virtual {v1, v7}, Landroid/view/View;->setPressed(Z)V

    .line 77
    .line 78
    .line 79
    instance-of v5, v1, Lcom/android/launcher3/BubbleTextView;

    .line 80
    .line 81
    if-eqz v5, :cond_3

    .line 82
    .line 83
    move-object v8, v1

    .line 84
    check-cast v8, Lcom/android/launcher3/BubbleTextView;

    .line 85
    .line 86
    invoke-virtual {v8}, Lcom/android/launcher3/BubbleTextView;->M()V

    .line 87
    .line 88
    .line 89
    :cond_3
    iget-object v8, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 90
    .line 91
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    invoke-virtual {v8}, Lcom/android/launcher3/G4;->t()Z

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    if-eqz v8, :cond_4

    .line 100
    .line 101
    iget-object v8, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 102
    .line 103
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 104
    .line 105
    .line 106
    move-result-object v8

    .line 107
    invoke-virtual {v8}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 112
    .line 113
    .line 114
    move-result-object v8

    .line 115
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 116
    .line 117
    .line 118
    move-result v9

    .line 119
    if-eqz v9, :cond_4

    .line 120
    .line 121
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v9

    .line 125
    check-cast v9, Lcom/android/launcher3/BubbleTextView;

    .line 126
    .line 127
    invoke-virtual {v9}, Landroid/widget/TextView;->clearFocus()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v9, v7}, Landroid/widget/TextView;->setPressed(Z)V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_4
    if-nez p2, :cond_5

    .line 135
    .line 136
    instance-of v8, v1, Lcom/android/launcher3/dragndrop/y;

    .line 137
    .line 138
    if-eqz v8, :cond_5

    .line 139
    .line 140
    move-object v8, v1

    .line 141
    check-cast v8, Lcom/android/launcher3/dragndrop/y;

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_5
    move-object/from16 v8, p2

    .line 145
    .line 146
    :goto_3
    instance-of v9, v1, Lcom/android/launcher3/folder/FolderIcon;

    .line 147
    .line 148
    const/4 v11, 0x1

    .line 149
    if-eqz v9, :cond_6

    .line 150
    .line 151
    iget-object v12, v0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 152
    .line 153
    move-object v13, v1

    .line 154
    check-cast v13, Lcom/android/launcher3/folder/FolderIcon;

    .line 155
    .line 156
    invoke-virtual {v13}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 157
    .line 158
    .line 159
    move-result-object v14

    .line 160
    invoke-virtual {v12, v14}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v13, v11}, Lcom/android/launcher3/folder/FolderIcon;->setForceHideDot(Z)V

    .line 164
    .line 165
    .line 166
    :cond_6
    iput-object v2, v0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 167
    .line 168
    invoke-virtual {v2}, Ln1/d;->i()Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    if-nez v12, :cond_7

    .line 173
    .line 174
    invoke-virtual {v2}, Ln1/d;->f()Landroid/graphics/drawable/Drawable;

    .line 175
    .line 176
    .line 177
    move-result-object v14

    .line 178
    iget-object v15, v0, Lcom/android/launcher3/Workspace;->z:[I

    .line 179
    .line 180
    invoke-virtual {v2, v14, v15}, Ln1/d;->m(Landroid/graphics/drawable/Drawable;[I)F

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    goto :goto_4

    .line 185
    :cond_7
    invoke-virtual {v2}, Ln1/d;->f()Landroid/graphics/drawable/Drawable;

    .line 186
    .line 187
    .line 188
    iget-object v14, v0, Lcom/android/launcher3/Workspace;->z:[I

    .line 189
    .line 190
    invoke-virtual {v2, v12, v14}, Ln1/d;->n(Landroid/view/View;[I)F

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    const/4 v14, 0x0

    .line 195
    :goto_4
    iget-object v15, v0, Lcom/android/launcher3/Workspace;->z:[I

    .line 196
    .line 197
    aget v16, v15, v7

    .line 198
    .line 199
    aget v15, v15, v11

    .line 200
    .line 201
    move v13, v7

    .line 202
    const/16 p2, 0x0

    .line 203
    .line 204
    new-instance v7, Landroid/graphics/Rect;

    .line 205
    .line 206
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 207
    .line 208
    .line 209
    if-eqz v8, :cond_8

    .line 210
    .line 211
    invoke-interface {v8, v7}, Lcom/android/launcher3/dragndrop/y;->g(Landroid/graphics/Rect;)V

    .line 212
    .line 213
    .line 214
    instance-of v13, v8, Lcom/android/launcher3/widget/x0;

    .line 215
    .line 216
    if-nez v13, :cond_8

    .line 217
    .line 218
    invoke-static {}, Lm1/a;->a()Z

    .line 219
    .line 220
    .line 221
    move-result v13

    .line 222
    if-nez v13, :cond_8

    .line 223
    .line 224
    iget v13, v7, Landroid/graphics/Rect;->top:I

    .line 225
    .line 226
    add-int/2addr v15, v13

    .line 227
    :cond_8
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 228
    .line 229
    .line 230
    move-result-object v13

    .line 231
    instance-of v13, v13, Lcom/android/launcher3/K5;

    .line 232
    .line 233
    if-eqz v13, :cond_9

    .line 234
    .line 235
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 236
    .line 237
    .line 238
    move-result-object v13

    .line 239
    check-cast v13, Lcom/android/launcher3/K5;

    .line 240
    .line 241
    iput-object v13, v0, Lcom/android/launcher3/Workspace;->m:Lcom/android/launcher3/K5;

    .line 242
    .line 243
    :cond_9
    if-nez v5, :cond_c

    .line 244
    .line 245
    instance-of v13, v1, Landroid/appwidget/AppWidgetHostView;

    .line 246
    .line 247
    if-eqz v13, :cond_a

    .line 248
    .line 249
    goto :goto_5

    .line 250
    :cond_a
    if-eqz v9, :cond_b

    .line 251
    .line 252
    goto :goto_5

    .line 253
    :cond_b
    const/4 v9, 0x0

    .line 254
    goto :goto_6

    .line 255
    :cond_c
    :goto_5
    move v9, v11

    .line 256
    :goto_6
    iget-object v13, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 257
    .line 258
    invoke-virtual {v13}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 259
    .line 260
    .line 261
    move-result-object v13

    .line 262
    invoke-static {v13}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 263
    .line 264
    .line 265
    move-result-object v13

    .line 266
    iget-boolean v13, v13, Lcom/android/launcher3/r4;->l0:Z

    .line 267
    .line 268
    if-eqz v13, :cond_d

    .line 269
    .line 270
    instance-of v13, v1, Landroid/appwidget/AppWidgetHostView;

    .line 271
    .line 272
    if-eqz v13, :cond_d

    .line 273
    .line 274
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v13

    .line 278
    instance-of v13, v13, Lcom/android/launcher3/model/data/A;

    .line 279
    .line 280
    if-eqz v13, :cond_d

    .line 281
    .line 282
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 283
    .line 284
    .line 285
    move-result-object v13

    .line 286
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v17

    .line 290
    check-cast v17, Lcom/android/launcher3/model/data/y;

    .line 291
    .line 292
    invoke-virtual/range {v17 .. v17}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 293
    .line 294
    .line 295
    move-result-object v11

    .line 296
    invoke-virtual {v13, v11}, Lcom/android/launcher3/H5;->B0(Landroid/content/ComponentName;)Z

    .line 297
    .line 298
    .line 299
    move-result v11

    .line 300
    if-eqz v11, :cond_d

    .line 301
    .line 302
    const/4 v9, 0x0

    .line 303
    :cond_d
    if-eqz v9, :cond_f

    .line 304
    .line 305
    iget-boolean v11, v10, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 306
    .line 307
    if-nez v11, :cond_f

    .line 308
    .line 309
    iget-object v11, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 310
    .line 311
    sget-object v13, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 312
    .line 313
    invoke-interface {v11, v13}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 314
    .line 315
    .line 316
    move-result v11

    .line 317
    if-nez v11, :cond_f

    .line 318
    .line 319
    invoke-static {v1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k0(Landroid/view/View;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    if-eqz v3, :cond_e

    .line 324
    .line 325
    const/4 v9, 0x1

    .line 326
    invoke-virtual {v3, v9}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->a0(Z)Lcom/android/launcher3/dragndrop/p$a;

    .line 327
    .line 328
    .line 329
    move-result-object v9

    .line 330
    goto :goto_7

    .line 331
    :cond_e
    move-object/from16 v9, p2

    .line 332
    .line 333
    :goto_7
    iput-object v9, v10, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 334
    .line 335
    invoke-static {}, Lx1/O;->k1()Z

    .line 336
    .line 337
    .line 338
    move-result v9

    .line 339
    if-eqz v9, :cond_10

    .line 340
    .line 341
    if-eqz v3, :cond_10

    .line 342
    .line 343
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 344
    .line 345
    .line 346
    goto :goto_8

    .line 347
    :cond_f
    new-instance v11, Ljava/lang/StringBuilder;

    .line 348
    .line 349
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 350
    .line 351
    .line 352
    const-string v13, "beginDragShared: can show popup: "

    .line 353
    .line 354
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    const-string v9, ", is accessible drag: "

    .line 361
    .line 362
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    iget-boolean v9, v10, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 366
    .line 367
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v9

    .line 374
    invoke-static {v3, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    .line 376
    .line 377
    :cond_10
    :goto_8
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 378
    .line 379
    .line 380
    move-result-object v3

    .line 381
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->p()Z

    .line 382
    .line 383
    .line 384
    move-result v3

    .line 385
    if-nez v3, :cond_15

    .line 386
    .line 387
    if-eqz v5, :cond_11

    .line 388
    .line 389
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 390
    .line 391
    invoke-virtual {v1}, Lcom/android/launcher3/BubbleTextView;->i0()Z

    .line 392
    .line 393
    .line 394
    move-result v1

    .line 395
    if-eqz v1, :cond_11

    .line 396
    .line 397
    goto :goto_9

    .line 398
    :cond_11
    iget-object v1, v10, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 399
    .line 400
    if-eqz v1, :cond_13

    .line 401
    .line 402
    invoke-interface {v1}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 403
    .line 404
    .line 405
    move-result-object v1

    .line 406
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 407
    .line 408
    iget-object v3, v10, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 409
    .line 410
    invoke-interface {v3}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 411
    .line 412
    .line 413
    move-result-object v3

    .line 414
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 415
    .line 416
    if-nez v1, :cond_12

    .line 417
    .line 418
    if-eqz v3, :cond_13

    .line 419
    .line 420
    :cond_12
    add-int v16, v16, v1

    .line 421
    .line 422
    add-int/2addr v15, v3

    .line 423
    :cond_13
    move/from16 v3, v16

    .line 424
    .line 425
    if-eqz v12, :cond_14

    .line 426
    .line 427
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 428
    .line 429
    mul-float/2addr v4, v2

    .line 430
    move-object/from16 v5, p3

    .line 431
    .line 432
    move v9, v2

    .line 433
    move-object v2, v8

    .line 434
    move-object v1, v12

    .line 435
    move v8, v4

    .line 436
    move v4, v15

    .line 437
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/dragndrop/j;->R(Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    return-object v0

    .line 442
    :cond_14
    move v9, v2

    .line 443
    move v1, v4

    .line 444
    move-object v2, v8

    .line 445
    move v4, v15

    .line 446
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 447
    .line 448
    mul-float v8, v9, v1

    .line 449
    .line 450
    move-object/from16 v5, p3

    .line 451
    .line 452
    move-object/from16 v6, p4

    .line 453
    .line 454
    move-object/from16 v10, p6

    .line 455
    .line 456
    move-object v1, v14

    .line 457
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/dragndrop/j;->Q(Landroid/graphics/drawable/Drawable;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    return-object v0

    .line 462
    :cond_15
    :goto_9
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 463
    .line 464
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 465
    .line 466
    invoke-interface {v1, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 467
    .line 468
    .line 469
    move-result v1

    .line 470
    if-eqz v1, :cond_17

    .line 471
    .line 472
    invoke-static {}, Lx1/d;->h()Z

    .line 473
    .line 474
    .line 475
    move-result v1

    .line 476
    if-eqz v1, :cond_16

    .line 477
    .line 478
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 479
    .line 480
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 481
    .line 482
    .line 483
    move-result-object v0

    .line 484
    const-string v1, "launcher_start_drag"

    .line 485
    .line 486
    invoke-static {v0, v1}, Lx1/d;->i(Landroid/content/Context;Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    goto :goto_a

    .line 490
    :cond_16
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 491
    .line 492
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 493
    .line 494
    .line 495
    move-result-object v0

    .line 496
    const/4 v13, 0x0

    .line 497
    invoke-virtual {v0, v13}, Landroid/widget/FrameLayout;->performHapticFeedback(I)Z

    .line 498
    .line 499
    .line 500
    :cond_17
    :goto_a
    return-object p2
.end method

.method public E1()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->E:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/Workspace;->e0:F

    .line 6
    .line 7
    const/high16 v0, 0x3f000000    # 0.5f

    .line 8
    .line 9
    cmpl-float p0, p0, v0

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public E2(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_a

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const-string v2, "Launcher.Workspace"

    .line 20
    .line 21
    if-eqz v1, :cond_8

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    instance-of v3, v3, Lcom/android/launcher3/model/data/I;

    .line 34
    .line 35
    if-eqz v3, :cond_7

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 42
    .line 43
    iget v4, v3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 44
    .line 45
    const/4 v5, 0x1

    .line 46
    const/4 v6, 0x6

    .line 47
    if-eq v6, v4, :cond_3

    .line 48
    .line 49
    if-eq v5, v4, :cond_3

    .line 50
    .line 51
    iget v4, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 52
    .line 53
    if-lez v4, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->K2(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    iget v4, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 60
    .line 61
    const/16 v6, -0x64

    .line 62
    .line 63
    if-ne v4, v6, :cond_4

    .line 64
    .line 65
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 66
    .line 67
    invoke-static {v4, v1, v5}, Lcom/android/launcher3/o;->d(Lcom/android/launcher3/C2;Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    :goto_1
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 72
    .line 73
    invoke-virtual {v4, v1, v3, v5}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 74
    .line 75
    .line 76
    :cond_4
    :goto_2
    iget v1, v3, Lcom/android/launcher3/model/data/I;->m:I

    .line 77
    .line 78
    const/4 v4, 0x2

    .line 79
    if-ne v1, v4, :cond_1

    .line 80
    .line 81
    iget-object v1, v3, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 82
    .line 83
    if-eqz v1, :cond_1

    .line 84
    .line 85
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    if-eqz v1, :cond_5

    .line 90
    .line 91
    iget-object v1, v3, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 92
    .line 93
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    goto :goto_3

    .line 102
    :cond_5
    iget-object v1, v3, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 103
    .line 104
    invoke-virtual {v1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    :goto_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-nez v4, :cond_6

    .line 113
    .line 114
    new-instance v2, Lcom/android/launcher3/X0;

    .line 115
    .line 116
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 117
    .line 118
    invoke-direct {v2, v4}, Lcom/android/launcher3/X0;-><init>(Landroid/content/Context;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v2, v1, v3}, Lcom/android/launcher3/X0;->s(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_6
    const-string v1, "removeAppsFromAdapter, packageName is null!"

    .line 126
    .line 127
    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_7
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    instance-of v3, v3, Lcom/android/launcher3/model/data/d;

    .line 136
    .line 137
    if-eqz v3, :cond_1

    .line 138
    .line 139
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Lcom/android/launcher3/model/data/d;

    .line 144
    .line 145
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 146
    .line 147
    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    if-eqz v4, :cond_1

    .line 156
    .line 157
    iget-object v4, v3, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 158
    .line 159
    if-eqz v4, :cond_1

    .line 160
    .line 161
    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    if-eqz v4, :cond_1

    .line 166
    .line 167
    iget-object v4, v3, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 168
    .line 169
    invoke-virtual {v4}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    new-instance v5, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .line 181
    .line 182
    const-string v6, "removeAppsList appInfo.title:"

    .line 183
    .line 184
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    iget-object v6, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 188
    .line 189
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const-string v6, " packageName:"

    .line 193
    .line 194
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    iget-object v2, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 208
    .line 209
    filled-new-array {v4}, [Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    iget-object v5, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 214
    .line 215
    invoke-virtual {v5}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    invoke-static {v5}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 220
    .line 221
    .line 222
    move-result-object v5

    .line 223
    invoke-virtual {v5}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 224
    .line 225
    .line 226
    move-result-object v5

    .line 227
    invoke-virtual {v5}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    invoke-virtual {v5, v4, v2}, Lz1/Q2;->onPackageRemoved(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 232
    .line 233
    .line 234
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 235
    .line 236
    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    invoke-virtual {v4}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    const/4 v5, 0x0

    .line 253
    invoke-virtual {v4, v3, v2, v5}, Lz1/Q2;->onPackagesUnavailable([Ljava/lang/String;Landroid/os/UserHandle;Z)V

    .line 254
    .line 255
    .line 256
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 257
    .line 258
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-virtual {v2, v1}, Lcom/android/launcher3/D3;->R0(Lcom/android/launcher3/BubbleTextView;)V

    .line 271
    .line 272
    .line 273
    goto/16 :goto_0

    .line 274
    .line 275
    :cond_8
    const-string v0, "removeAppsFromAdapter enter!"

    .line 276
    .line 277
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    .line 279
    .line 280
    invoke-direct {p0, p2}, Lcom/android/launcher3/Workspace;->b3(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 281
    .line 282
    .line 283
    move-result-object p2

    .line 284
    if-eqz p2, :cond_9

    .line 285
    .line 286
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    if-eqz v0, :cond_9

    .line 291
    .line 292
    new-instance v0, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 295
    .line 296
    .line 297
    const-string v1, "removeAppsList.size:"

    .line 298
    .line 299
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {p2}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    .line 315
    .line 316
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 317
    .line 318
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/H5;->E1(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 331
    .line 332
    .line 333
    return-void

    .line 334
    :cond_9
    const-string p0, "removeAppsFromAdapter, removeAppsList is null !"

    .line 335
    .line 336
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    .line 338
    .line 339
    :cond_a
    :goto_4
    return-void
.end method

.method E3(Lcom/android/launcher3/model/data/y;Landroid/view/View;Z)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const-string p0, "Launcher.Workspace"

    .line 33
    .line 34
    const-string p1, "willCreateUserFolder result false, dropOverView in MoreIconDrag dragViews"

    .line 35
    .line 36
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return v1

    .line 40
    :cond_0
    const/4 v0, 0x1

    .line 41
    if-eqz p2, :cond_4

    .line 42
    .line 43
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Lc1/b;

    .line 48
    .line 49
    iget-boolean v3, v2, Lc1/b;->e:Z

    .line 50
    .line 51
    if-eqz v3, :cond_2

    .line 52
    .line 53
    invoke-virtual {v2}, Lc1/b;->c()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {v2}, Lc1/b;->a()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-ne v3, v4, :cond_1

    .line 62
    .line 63
    invoke-virtual {v2}, Lc1/b;->d()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    invoke-virtual {v2}, Lc1/b;->b()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eq v3, v4, :cond_2

    .line 72
    .line 73
    :cond_1
    return v1

    .line 74
    :cond_2
    iget v3, v2, Lc1/b;->f:I

    .line 75
    .line 76
    if-ne v3, v0, :cond_3

    .line 77
    .line 78
    iget v2, v2, Lc1/b;->g:I

    .line 79
    .line 80
    if-ne v2, v0, :cond_3

    .line 81
    .line 82
    iget v2, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 83
    .line 84
    if-ne v2, v0, :cond_3

    .line 85
    .line 86
    iget v2, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 87
    .line 88
    if-eq v2, v0, :cond_4

    .line 89
    .line 90
    :cond_3
    return v1

    .line 91
    :cond_4
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 92
    .line 93
    if-eqz v2, :cond_5

    .line 94
    .line 95
    iget-object v2, v2, Lc1/a;->e:Landroid/view/View;

    .line 96
    .line 97
    if-ne p2, v2, :cond_5

    .line 98
    .line 99
    move v2, v0

    .line 100
    goto :goto_0

    .line 101
    :cond_5
    move v2, v1

    .line 102
    :goto_0
    if-eqz p2, :cond_8

    .line 103
    .line 104
    if-nez v2, :cond_8

    .line 105
    .line 106
    if-eqz p3, :cond_6

    .line 107
    .line 108
    iget-boolean p0, p0, Lcom/android/launcher3/Workspace;->P:Z

    .line 109
    .line 110
    if-nez p0, :cond_6

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_6
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->t2(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_7

    .line 122
    .line 123
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 128
    .line 129
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 130
    .line 131
    const/16 p2, -0x67

    .line 132
    .line 133
    if-eq p0, p2, :cond_7

    .line 134
    .line 135
    move p0, v0

    .line 136
    goto :goto_1

    .line 137
    :cond_7
    move p0, v1

    .line 138
    :goto_1
    iget p1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 139
    .line 140
    invoke-static {p1}, Lcom/android/launcher3/model/data/p;->R(I)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p0, :cond_8

    .line 145
    .line 146
    if-eqz p1, :cond_8

    .line 147
    .line 148
    return v0

    .line 149
    :cond_8
    :goto_2
    return v1
.end method

.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, v0, Lc1/a;->e:Landroid/view/View;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    if-nez v2, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 63
    .line 64
    invoke-virtual {v2, v1}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 69
    .line 70
    iget-object v0, v0, Lc1/a;->e:Landroid/view/View;

    .line 71
    .line 72
    instance-of v1, v0, Lcom/android/launcher3/widget/T;

    .line 73
    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->getContentViewParent()Landroid/view/ViewGroup;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    goto :goto_1

    .line 87
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    :goto_1
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 98
    .line 99
    iget-object v1, v1, Lc1/a;->e:Landroid/view/View;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 105
    .line 106
    const/4 v1, 0x6

    .line 107
    if-eqz v0, :cond_5

    .line 108
    .line 109
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_5

    .line 120
    .line 121
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 122
    .line 123
    if-eqz v0, :cond_5

    .line 124
    .line 125
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 126
    .line 127
    invoke-virtual {v0}, Ln1/d;->k()Landroid/graphics/Bitmap;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget-object v2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 132
    .line 133
    iget v3, v2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 134
    .line 135
    if-ne v3, v1, :cond_4

    .line 136
    .line 137
    instance-of v3, v2, Lcom/android/launcher3/model/data/I;

    .line 138
    .line 139
    if-eqz v3, :cond_4

    .line 140
    .line 141
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 142
    .line 143
    iget-object v0, v2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 144
    .line 145
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 146
    .line 147
    invoke-virtual {v0, v2}, Ls1/d;->m(Landroid/content/Context;)Ls1/o;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-static {v0}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    :cond_4
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 156
    .line 157
    invoke-virtual {v2, v0}, Ln1/d;->h(Landroid/graphics/Bitmap;)V

    .line 158
    .line 159
    .line 160
    :cond_5
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->r3()V

    .line 161
    .line 162
    .line 163
    iget-boolean v0, p2, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 164
    .line 165
    const/4 v2, 0x0

    .line 166
    if-eqz v0, :cond_6

    .line 167
    .line 168
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 169
    .line 170
    if-ne v0, p0, :cond_8

    .line 171
    .line 172
    :cond_6
    iput-boolean v2, p0, Lcom/android/launcher3/Workspace;->p:Z

    .line 173
    .line 174
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->z0(Lcom/android/launcher3/n0$a;)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 178
    .line 179
    iget v0, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 180
    .line 181
    const/4 v3, 0x4

    .line 182
    if-ne v0, v3, :cond_8

    .line 183
    .line 184
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 185
    .line 186
    if-eq v0, p0, :cond_8

    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    if-ge v0, v3, :cond_8

    .line 197
    .line 198
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 203
    .line 204
    iget-object v4, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 205
    .line 206
    invoke-virtual {v3, v4}, Lcom/android/launcher3/CellLayout;->T(Lcom/android/launcher3/model/data/y;)Z

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    if-eqz v3, :cond_7

    .line 211
    .line 212
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 213
    .line 214
    .line 215
    goto :goto_3

    .line 216
    :cond_7
    add-int/lit8 v0, v0, 0x1

    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_8
    :goto_3
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n0:Lcom/android/launcher3/dragndrop/j$b;

    .line 220
    .line 221
    if-eqz v0, :cond_9

    .line 222
    .line 223
    invoke-interface {v0, p1, p2}, Lcom/android/launcher3/dragndrop/j$b;->F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

    .line 224
    .line 225
    .line 226
    :cond_9
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 227
    .line 228
    instance-of v0, p2, Lcom/android/launcher3/model/data/I;

    .line 229
    .line 230
    const/4 v3, 0x1

    .line 231
    if-nez v0, :cond_a

    .line 232
    .line 233
    instance-of v0, p2, Lcom/android/launcher3/model/data/d;

    .line 234
    .line 235
    if-eqz v0, :cond_d

    .line 236
    .line 237
    :cond_a
    iget v0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 238
    .line 239
    if-eqz v0, :cond_b

    .line 240
    .line 241
    if-eq v0, v3, :cond_b

    .line 242
    .line 243
    if-ne v0, v1, :cond_d

    .line 244
    .line 245
    :cond_b
    iget p2, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 246
    .line 247
    if-lez p2, :cond_c

    .line 248
    .line 249
    move v2, v3

    .line 250
    :cond_c
    invoke-direct {p0, v3, v2}, Lcom/android/launcher3/Workspace;->W0(ZZ)V

    .line 251
    .line 252
    .line 253
    :cond_d
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 254
    .line 255
    instance-of p2, p2, Lcom/android/launcher3/model/data/p;

    .line 256
    .line 257
    if-eqz p2, :cond_e

    .line 258
    .line 259
    iput-boolean v3, p0, Lcom/android/launcher3/Workspace;->x0:Z

    .line 260
    .line 261
    :cond_e
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 262
    .line 263
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 264
    .line 265
    invoke-interface {p2, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 266
    .line 267
    .line 268
    move-result p2

    .line 269
    if-nez p2, :cond_f

    .line 270
    .line 271
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 272
    .line 273
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 274
    .line 275
    invoke-interface {p2, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 276
    .line 277
    .line 278
    move-result p2

    .line 279
    if-eqz p2, :cond_10

    .line 280
    .line 281
    :cond_f
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 282
    .line 283
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 284
    .line 285
    .line 286
    move-result-object p2

    .line 287
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 288
    .line 289
    invoke-virtual {p2, v0}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 290
    .line 291
    .line 292
    :cond_10
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->k0:Lcom/android/launcher3/logging/StatsLogManager;

    .line 293
    .line 294
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 299
    .line 300
    invoke-interface {p0, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 305
    .line 306
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->o:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 311
    .line 312
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 313
    .line 314
    .line 315
    return-void
.end method

.method public F0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    instance-of v1, p2, Lcom/android/launcher3/allapps/r;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Lp1/a;->d(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {p1}, Lx1/v;->v(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    move-object v6, v0

    .line 24
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 25
    .line 26
    new-instance v7, Ln1/d;

    .line 27
    .line 28
    invoke-direct {v7, p1}, Ln1/d;-><init>(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    move-object v2, p0

    .line 33
    move-object v3, p1

    .line 34
    move-object v5, p2

    .line 35
    move-object v8, p3

    .line 36
    invoke-virtual/range {v2 .. v8}, Lcom/android/launcher3/Workspace;->E0(Landroid/view/View;Lcom/android/launcher3/dragndrop/y;Lcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Ln1/d;Lcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    move-object v3, p1

    .line 41
    new-instance p0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string p1, "Drag started with a view that has no tag set. This will cause a crash (issue 11627249) down the line. View: "

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p1, "  tag: "

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 71
    .line 72
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    throw p1
.end method

.method public F1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/Workspace;->f0:Z

    .line 2
    .line 3
    return p0
.end method

.method public F2(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, p1, v1}, Lcom/android/launcher3/Workspace;->G2(IZLjava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method F3(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;[IFZ)Z
    .locals 1

    .line 1
    invoke-virtual {p2, p3}, Lcom/android/launcher3/CellLayout;->L([I)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    cmpl-float p4, p4, v0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-lez p4, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    aget p4, p3, v0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aget p3, p3, v0

    .line 15
    .line 16
    invoke-virtual {p2, p4, p3}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0, p1, p2, p5}, Lcom/android/launcher3/Workspace;->E3(Lcom/android/launcher3/model/data/y;Landroid/view/View;Z)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public G(Lcom/android/launcher3/n0$a;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p1

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/android/launcher3/Workspace;->l3()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_8

    .line 12
    .line 13
    :cond_0
    iget-object v8, v7, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    if-nez v8, :cond_1

    .line 16
    .line 17
    goto/16 :goto_8

    .line 18
    .line 19
    :cond_1
    invoke-static {}, Lx1/O;->p0()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, v8}, Lz1/y0;->z(Lcom/android/launcher3/model/data/y;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    goto/16 :goto_8

    .line 42
    .line 43
    :cond_2
    iget v1, v8, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 44
    .line 45
    if-ltz v1, :cond_e

    .line 46
    .line 47
    iget v1, v8, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 48
    .line 49
    if-ltz v1, :cond_e

    .line 50
    .line 51
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 52
    .line 53
    invoke-virtual {v7, v1}, Lcom/android/launcher3/n0$a;->a([F)[F

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 58
    .line 59
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 60
    .line 61
    if-nez v1, :cond_3

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    :goto_0
    move-object v14, v1

    .line 65
    goto :goto_1

    .line 66
    :cond_3
    iget-object v1, v1, Lc1/a;->e:Landroid/view/View;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :goto_1
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/android/launcher3/dragndrop/j;->H()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    const/4 v9, 0x0

    .line 76
    const/4 v10, 0x1

    .line 77
    if-nez v1, :cond_6

    .line 78
    .line 79
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 80
    .line 81
    aget v2, v1, v9

    .line 82
    .line 83
    aget v1, v1, v10

    .line 84
    .line 85
    invoke-direct {v0, v7, v2, v1, v9}, Lcom/android/launcher3/Workspace;->U2(Lcom/android/launcher3/n0$a;FFZ)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 92
    .line 93
    if-eqz v1, :cond_5

    .line 94
    .line 95
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 96
    .line 97
    invoke-virtual {v2, v1}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_4

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_4
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->D:Lcom/android/launcher3/dragndrop/O;

    .line 105
    .line 106
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Lcom/android/launcher3/dragndrop/O;->d(Lcom/android/launcher3/CellLayout;)V

    .line 109
    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_5
    :goto_2
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->D:Lcom/android/launcher3/dragndrop/O;

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/android/launcher3/dragndrop/O;->b()V

    .line 115
    .line 116
    .line 117
    :cond_6
    :goto_3
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 118
    .line 119
    if-eqz v1, :cond_d

    .line 120
    .line 121
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 122
    .line 123
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/Workspace;->n2(Lcom/android/launcher3/CellLayout;[F)V

    .line 124
    .line 125
    .line 126
    iget v3, v8, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 127
    .line 128
    iget v4, v8, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 129
    .line 130
    iget v1, v8, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 131
    .line 132
    if-lez v1, :cond_7

    .line 133
    .line 134
    iget v2, v8, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 135
    .line 136
    if-lez v2, :cond_7

    .line 137
    .line 138
    move/from16 v16, v1

    .line 139
    .line 140
    move/from16 v17, v2

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_7
    move/from16 v16, v3

    .line 144
    .line 145
    move/from16 v17, v4

    .line 146
    .line 147
    :goto_4
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 148
    .line 149
    aget v2, v1, v9

    .line 150
    .line 151
    float-to-int v2, v2

    .line 152
    aget v1, v1, v10

    .line 153
    .line 154
    float-to-int v1, v1

    .line 155
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 156
    .line 157
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 158
    .line 159
    move/from16 v18, v2

    .line 160
    .line 161
    move v2, v1

    .line 162
    move/from16 v1, v18

    .line 163
    .line 164
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/Workspace;->a1(IIIILcom/android/launcher3/CellLayout;[I)[I

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    iput-object v1, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 169
    .line 170
    aget v6, v1, v9

    .line 171
    .line 172
    aget v1, v1, v10

    .line 173
    .line 174
    invoke-virtual {v0, v6, v1}, Lcom/android/launcher3/Workspace;->T2(II)V

    .line 175
    .line 176
    .line 177
    iget-boolean v2, v0, Lcom/android/launcher3/Workspace;->r0:Z

    .line 178
    .line 179
    if-eqz v2, :cond_8

    .line 180
    .line 181
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 182
    .line 183
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 184
    .line 185
    aget v4, v3, v9

    .line 186
    .line 187
    aget v3, v3, v10

    .line 188
    .line 189
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 190
    .line 191
    invoke-virtual {v2, v4, v3, v5}, Lcom/android/launcher3/CellLayout;->K(FF[I)F

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    goto :goto_5

    .line 196
    :cond_8
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 197
    .line 198
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 199
    .line 200
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 201
    .line 202
    invoke-direct {v0, v2, v3, v4}, Lcom/android/launcher3/Workspace;->d1([I[FLcom/android/launcher3/CellLayout;)F

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    :goto_5
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 207
    .line 208
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    const v4, 0x7f0b032d

    .line 213
    .line 214
    .line 215
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    instance-of v4, v3, Ljava/lang/Boolean;

    .line 220
    .line 221
    if-eqz v4, :cond_9

    .line 222
    .line 223
    check-cast v3, Ljava/lang/Boolean;

    .line 224
    .line 225
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    if-nez v3, :cond_a

    .line 230
    .line 231
    :cond_9
    invoke-direct {v0, v2, v7}, Lcom/android/launcher3/Workspace;->a2(FLcom/android/launcher3/n0$a;)V

    .line 232
    .line 233
    .line 234
    :cond_a
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 235
    .line 236
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 237
    .line 238
    invoke-interface {v3, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 239
    .line 240
    .line 241
    move-result v3

    .line 242
    if-eqz v3, :cond_b

    .line 243
    .line 244
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 245
    .line 246
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 247
    .line 248
    invoke-virtual {v3, v4}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    if-eqz v3, :cond_b

    .line 253
    .line 254
    move-object v3, v7

    .line 255
    move v7, v1

    .line 256
    move-object v1, v3

    .line 257
    move v3, v10

    .line 258
    move v8, v3

    .line 259
    :goto_6
    move/from16 v4, v16

    .line 260
    .line 261
    move/from16 v5, v17

    .line 262
    .line 263
    goto :goto_7

    .line 264
    :cond_b
    move v3, v9

    .line 265
    iget-object v9, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 266
    .line 267
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 268
    .line 269
    aget v3, v4, v3

    .line 270
    .line 271
    float-to-int v3, v3

    .line 272
    aget v4, v4, v10

    .line 273
    .line 274
    float-to-int v11, v4

    .line 275
    iget v12, v8, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 276
    .line 277
    iget v13, v8, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 278
    .line 279
    iget-object v15, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 280
    .line 281
    move v8, v10

    .line 282
    move v10, v3

    .line 283
    invoke-virtual/range {v9 .. v15}, Lcom/android/launcher3/CellLayout;->a0(IIIILandroid/view/View;[I)Z

    .line 284
    .line 285
    .line 286
    move-result v10

    .line 287
    move-object v3, v7

    .line 288
    move v7, v1

    .line 289
    move-object v1, v3

    .line 290
    move v3, v10

    .line 291
    goto :goto_6

    .line 292
    :goto_7
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/Workspace;->b2(Lcom/android/launcher3/n0$a;FZIIII)V

    .line 293
    .line 294
    .line 295
    move v10, v3

    .line 296
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    const v2, 0x7f0b0353

    .line 303
    .line 304
    .line 305
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    iget v2, v0, Lcom/android/launcher3/Workspace;->V:I

    .line 310
    .line 311
    if-eq v2, v8, :cond_c

    .line 312
    .line 313
    const/4 v3, 0x2

    .line 314
    if-eq v2, v3, :cond_c

    .line 315
    .line 316
    if-eqz v10, :cond_c

    .line 317
    .line 318
    instance-of v2, v1, Ljava/lang/Boolean;

    .line 319
    .line 320
    if-eqz v2, :cond_d

    .line 321
    .line 322
    check-cast v1, Ljava/lang/Boolean;

    .line 323
    .line 324
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    if-eqz v1, :cond_d

    .line 329
    .line 330
    :cond_c
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 331
    .line 332
    if-eqz v0, :cond_d

    .line 333
    .line 334
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->x0()V

    .line 335
    .line 336
    .line 337
    :cond_d
    :goto_8
    return-void

    .line 338
    :cond_e
    new-instance v0, Ljava/lang/RuntimeException;

    .line 339
    .line 340
    const-string v1, "Improper spans found"

    .line 341
    .line 342
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    throw v0
.end method

.method public G0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->T:Landroid/view/View;

    .line 3
    .line 4
    return-void
.end method

.method protected G1()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o0:Lz2/a$a;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getUnboundedScroll()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 14
    .line 15
    if-gt v0, v1, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getUnboundedScroll()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget p0, p0, Lcom/android/launcher3/V4;->mMinScroll:I

    .line 26
    .line 27
    if-ge v0, p0, :cond_2

    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public G2(IZLjava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_5

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->c3()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    if-lez p1, :cond_2

    .line 50
    .line 51
    new-instance v0, Lcom/android/launcher3/E6;

    .line 52
    .line 53
    invoke-direct {v0, p0, p2, p3}, Lcom/android/launcher3/E6;-><init>(Lcom/android/launcher3/Workspace;ZLjava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    int-to-long p1, p1

    .line 57
    invoke-virtual {p0, v0, p1, p2}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->Q0()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->r1()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    new-instance p1, Lcom/android/launcher3/F6;

    .line 71
    .line 72
    invoke-direct {p1, p0}, Lcom/android/launcher3/F6;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->b1(Ljava/util/function/Consumer;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->p3()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->f3()V

    .line 89
    .line 90
    .line 91
    :cond_3
    if-eqz p2, :cond_4

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->i3()V

    .line 94
    .line 95
    .line 96
    :cond_4
    if-eqz p3, :cond_5

    .line 97
    .line 98
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 99
    .line 100
    .line 101
    :cond_5
    :goto_0
    return-void
.end method

.method public G3()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const v0, 0x3dcccccd    # 0.1f

    .line 8
    .line 9
    .line 10
    cmpl-float p0, p0, v0

    .line 11
    .line 12
    if-lez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method protected H1()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o0:Lz2/a$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lz2/a$a;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getUnboundedScroll()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget p0, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 16
    .line 17
    if-le v0, p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public H2()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/Workspace$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/Workspace$b;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public H3()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->a0()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v0, v2

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    move v0, v1

    .line 33
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/android/launcher3/V3;

    .line 44
    .line 45
    sget v3, Lcom/android/launcher3/V3;->g:I

    .line 46
    .line 47
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V3;->hasFlag(I)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_3

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_2
    return v2

    .line 57
    :cond_3
    :goto_2
    return v1
.end method

.method public I(Lcom/android/launcher3/n0$a;)Z
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->w:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 4
    .line 5
    const/4 v11, 0x1

    .line 6
    if-eq v1, p0, :cond_b

    .line 7
    .line 8
    const/4 v12, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return v12

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->l3()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    return v12

    .line 19
    :cond_1
    invoke-static {}, Lx1/O;->p0()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lz1/y0;->z(Lcom/android/launcher3/model/data/y;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    const-string p0, "Launcher.Workspace"

    .line 44
    .line 45
    const-string p1, "acceptDrop: monkey is running, repeated icons cannot be added."

    .line 46
    .line 47
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return v12

    .line 51
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->C:[F

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Lcom/android/launcher3/n0$a;->a([F)[F

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->C:[F

    .line 58
    .line 59
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/Workspace;->n2(Lcom/android/launcher3/CellLayout;[F)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    iget v2, v1, Lcom/android/launcher3/util/C;->c:I

    .line 67
    .line 68
    iget v1, v1, Lcom/android/launcher3/util/C;->d:I

    .line 69
    .line 70
    :goto_0
    move v7, v1

    .line 71
    move v8, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 74
    .line 75
    iget v2, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 76
    .line 77
    iget v1, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :goto_1
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 81
    .line 82
    instance-of v2, v1, Lcom/android/launcher3/widget/z0;

    .line 83
    .line 84
    if-eqz v2, :cond_4

    .line 85
    .line 86
    move-object v2, v1

    .line 87
    check-cast v2, Lcom/android/launcher3/widget/z0;

    .line 88
    .line 89
    iget v2, v2, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 90
    .line 91
    check-cast v1, Lcom/android/launcher3/widget/z0;

    .line 92
    .line 93
    iget v1, v1, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 94
    .line 95
    move v4, v1

    .line 96
    move v3, v2

    .line 97
    goto :goto_2

    .line 98
    :cond_4
    move v4, v7

    .line 99
    move v3, v8

    .line 100
    :goto_2
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->C:[F

    .line 101
    .line 102
    aget v2, v1, v12

    .line 103
    .line 104
    float-to-int v2, v2

    .line 105
    aget v1, v1, v11

    .line 106
    .line 107
    float-to-int v1, v1

    .line 108
    iget-object v6, p0, Lcom/android/launcher3/Workspace;->r:[I

    .line 109
    .line 110
    move v5, v2

    .line 111
    move v2, v1

    .line 112
    move v1, v5

    .line 113
    move-object v5, v0

    .line 114
    move-object v0, p0

    .line 115
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/Workspace;->a1(IIIILcom/android/launcher3/CellLayout;[I)[I

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    move v6, v3

    .line 120
    move v9, v4

    .line 121
    move-object v2, v5

    .line 122
    iput-object p0, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 123
    .line 124
    iget-boolean v1, v0, Lcom/android/launcher3/Workspace;->r0:Z

    .line 125
    .line 126
    if-eqz v1, :cond_5

    .line 127
    .line 128
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 129
    .line 130
    aget v3, v1, v12

    .line 131
    .line 132
    aget v1, v1, v11

    .line 133
    .line 134
    invoke-virtual {v2, v3, v1, p0}, Lcom/android/launcher3/CellLayout;->K(FF[I)F

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    :goto_3
    move v4, p0

    .line 139
    goto :goto_4

    .line 140
    :cond_5
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 141
    .line 142
    invoke-direct {v0, p0, v1, v2}, Lcom/android/launcher3/Workspace;->d1([I[FLcom/android/launcher3/CellLayout;)F

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    goto :goto_3

    .line 147
    :goto_4
    iget-boolean p0, v0, Lcom/android/launcher3/Workspace;->P:Z

    .line 148
    .line 149
    if-eqz p0, :cond_6

    .line 150
    .line 151
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 152
    .line 153
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 154
    .line 155
    const/4 v5, 0x1

    .line 156
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/Workspace;->F3(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;[IFZ)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    move-object v13, v0

    .line 161
    if-eqz p0, :cond_7

    .line 162
    .line 163
    return v11

    .line 164
    :cond_6
    move-object v13, v0

    .line 165
    :cond_7
    iget-boolean p0, v13, Lcom/android/launcher3/Workspace;->Q:Z

    .line 166
    .line 167
    if-eqz p0, :cond_8

    .line 168
    .line 169
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 170
    .line 171
    iget-object v0, v13, Lcom/android/launcher3/Workspace;->r:[I

    .line 172
    .line 173
    invoke-virtual {v13, p0, v2, v0, v4}, Lcom/android/launcher3/Workspace;->D3(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;[IF)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_8

    .line 178
    .line 179
    return v11

    .line 180
    :cond_8
    const/4 p0, 0x2

    .line 181
    new-array p0, p0, [I

    .line 182
    .line 183
    iget-object v0, v13, Lcom/android/launcher3/Workspace;->C:[F

    .line 184
    .line 185
    aget v1, v0, v12

    .line 186
    .line 187
    float-to-int v1, v1

    .line 188
    aget v0, v0, v11

    .line 189
    .line 190
    float-to-int v0, v0

    .line 191
    move v5, v8

    .line 192
    iget-object v8, v13, Lcom/android/launcher3/Workspace;->r:[I

    .line 193
    .line 194
    const/4 v10, 0x4

    .line 195
    move v3, v6

    .line 196
    move v6, v7

    .line 197
    const/4 v7, 0x0

    .line 198
    move-object v4, v2

    .line 199
    move v2, v0

    .line 200
    move-object v0, v4

    .line 201
    move v4, v9

    .line 202
    move-object v9, p0

    .line 203
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/CellLayout;->n0(IIIIIILandroid/view/View;[I[II)[I

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    move-object v2, v0

    .line 208
    iput-object p0, v13, Lcom/android/launcher3/Workspace;->r:[I

    .line 209
    .line 210
    aget v0, p0, v12

    .line 211
    .line 212
    if-ltz v0, :cond_9

    .line 213
    .line 214
    aget p0, p0, v11

    .line 215
    .line 216
    if-ltz p0, :cond_9

    .line 217
    .line 218
    goto :goto_5

    .line 219
    :cond_9
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 220
    .line 221
    instance-of p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 222
    .line 223
    if-eqz p0, :cond_a

    .line 224
    .line 225
    iget-object p0, v13, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 226
    .line 227
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-virtual {p0}, Lcom/android/launcher3/G4;->r()Z

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    if-nez p0, :cond_c

    .line 236
    .line 237
    :cond_a
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 238
    .line 239
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 240
    .line 241
    invoke-virtual {v13, v2, p0, p1}, Lcom/android/launcher3/Workspace;->x2(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 242
    .line 243
    .line 244
    return v12

    .line 245
    :cond_b
    move-object v13, p0

    .line 246
    move-object v2, v0

    .line 247
    :cond_c
    :goto_5
    invoke-virtual {v13, v2}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    sget-object p1, Lcom/android/launcher3/M6;->d:Lcom/android/launcher3/util/z0;

    .line 252
    .line 253
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 254
    .line 255
    .line 256
    move-result p0

    .line 257
    if-eqz p0, :cond_d

    .line 258
    .line 259
    invoke-virtual {v13}, Lcom/android/launcher3/Workspace;->O0()Lcom/android/launcher3/util/z0;

    .line 260
    .line 261
    .line 262
    :cond_d
    return v11
.end method

.method public I1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/Workspace;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method public I2(Ljava/util/function/Predicate;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->getWorkspaceAndHotseatCellLayouts()[Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    move v3, v2

    .line 8
    :goto_0
    if-ge v3, v1, :cond_b

    .line 9
    .line 10
    aget-object v4, v0, v3

    .line 11
    .line 12
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    new-instance v6, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v7

    .line 25
    const/4 v8, 0x1

    .line 26
    sub-int/2addr v7, v8

    .line 27
    :goto_1
    if-ltz v7, :cond_5

    .line 28
    .line 29
    invoke-virtual {v5, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v9

    .line 33
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v10

    .line 37
    instance-of v10, v10, Lcom/android/launcher3/model/data/y;

    .line 38
    .line 39
    if-nez v10, :cond_0

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_0
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v10

    .line 46
    check-cast v10, Lcom/android/launcher3/model/data/y;

    .line 47
    .line 48
    invoke-interface {p1, v10}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v11

    .line 52
    if-eqz v11, :cond_2

    .line 53
    .line 54
    invoke-virtual {v4, v9}, Lcom/android/launcher3/CellLayout;->removeViewInLayout(Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    instance-of v10, v9, Lcom/android/launcher3/n0;

    .line 58
    .line 59
    if-eqz v10, :cond_1

    .line 60
    .line 61
    iget-object v10, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 62
    .line 63
    move-object v11, v9

    .line 64
    check-cast v11, Lcom/android/launcher3/n0;

    .line 65
    .line 66
    invoke-virtual {v10, v11}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_2
    instance-of v11, v9, Lcom/android/launcher3/folder/FolderIcon;

    .line 74
    .line 75
    if-eqz v11, :cond_3

    .line 76
    .line 77
    check-cast v9, Lcom/android/launcher3/folder/FolderIcon;

    .line 78
    .line 79
    check-cast v10, Lcom/android/launcher3/model/data/p;

    .line 80
    .line 81
    invoke-virtual {v10}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 82
    .line 83
    .line 84
    move-result-object v10

    .line 85
    invoke-virtual {v10}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 86
    .line 87
    .line 88
    move-result-object v10

    .line 89
    invoke-interface {v10, p1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 90
    .line 91
    .line 92
    move-result-object v10

    .line 93
    new-instance v11, Lcom/android/launcher3/p6;

    .line 94
    .line 95
    invoke-direct {v11}, Lcom/android/launcher3/p6;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-interface {v10, v11}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v10

    .line 102
    check-cast v10, [Lcom/android/launcher3/model/data/y;

    .line 103
    .line 104
    array-length v11, v10

    .line 105
    if-lez v11, :cond_4

    .line 106
    .line 107
    invoke-virtual {v9}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 108
    .line 109
    .line 110
    move-result-object v9

    .line 111
    invoke-virtual {v9, v2, v10}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_3
    instance-of v11, v10, Lcom/android/launcher3/model/data/l;

    .line 116
    .line 117
    if-eqz v11, :cond_4

    .line 118
    .line 119
    move-object v11, v10

    .line 120
    check-cast v11, Lcom/android/launcher3/model/data/l;

    .line 121
    .line 122
    invoke-virtual {v11, p1}, Lcom/android/launcher3/model/data/m;->w(Ljava/util/function/Predicate;)Z

    .line 123
    .line 124
    .line 125
    move-result v11

    .line 126
    if-eqz v11, :cond_4

    .line 127
    .line 128
    iget-object v11, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 129
    .line 130
    invoke-virtual {v11, v9, v10, v8}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 131
    .line 132
    .line 133
    :cond_4
    :goto_2
    add-int/lit8 v7, v7, -0x1

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_5
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    if-nez v5, :cond_7

    .line 141
    .line 142
    iget-object v5, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 143
    .line 144
    invoke-static {v5, v6, v4}, Lcom/android/launcher3/o;->e(Lcom/android/launcher3/C2;Ljava/util/ArrayList;Lcom/android/launcher3/CellLayout;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    :cond_6
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    if-eqz v5, :cond_7

    .line 156
    .line 157
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    check-cast v5, Landroid/view/View;

    .line 162
    .line 163
    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v6

    .line 167
    instance-of v6, v6, Lcom/android/launcher3/model/data/I;

    .line 168
    .line 169
    if-eqz v6, :cond_6

    .line 170
    .line 171
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    check-cast v5, Lcom/android/launcher3/model/data/I;

    .line 180
    .line 181
    invoke-static {v6, v5}, Lz1/t1;->v(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V

    .line 182
    .line 183
    .line 184
    goto :goto_3

    .line 185
    :cond_7
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 186
    .line 187
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    if-eqz v4, :cond_9

    .line 192
    .line 193
    new-instance v5, Ljava/util/ArrayList;

    .line 194
    .line 195
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .line 197
    .line 198
    iget-object v6, v4, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 199
    .line 200
    invoke-virtual {v6}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 209
    .line 210
    .line 211
    move-result v7

    .line 212
    const-string v8, "Launcher.Workspace"

    .line 213
    .line 214
    if-eqz v7, :cond_8

    .line 215
    .line 216
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v7

    .line 220
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 221
    .line 222
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    new-instance v9, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .line 229
    .line 230
    const-string v10, "itemsInHideFolder: "

    .line 231
    .line 232
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v7

    .line 242
    invoke-static {v8, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    .line 244
    .line 245
    goto :goto_4

    .line 246
    :cond_8
    invoke-virtual {v5}, Ljava/util/ArrayList;->spliterator()Ljava/util/Spliterator;

    .line 247
    .line 248
    .line 249
    move-result-object v5

    .line 250
    invoke-static {v5, v2}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    .line 251
    .line 252
    .line 253
    move-result-object v5

    .line 254
    invoke-interface {v5, p1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 255
    .line 256
    .line 257
    move-result-object v5

    .line 258
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 259
    .line 260
    .line 261
    move-result-object v6

    .line 262
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    check-cast v5, Ljava/util/Collection;

    .line 267
    .line 268
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 273
    .line 274
    .line 275
    move-result v6

    .line 276
    if-eqz v6, :cond_9

    .line 277
    .line 278
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v6

    .line 282
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 283
    .line 284
    filled-new-array {v6}, [Lcom/android/launcher3/model/data/y;

    .line 285
    .line 286
    .line 287
    move-result-object v7

    .line 288
    invoke-virtual {v4, v2, v7}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 289
    .line 290
    .line 291
    new-instance v7, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 294
    .line 295
    .line 296
    const-string v9, "itemToRemove: "

    .line 297
    .line 298
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v6

    .line 308
    invoke-static {v8, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    .line 310
    .line 311
    goto :goto_5

    .line 312
    :cond_9
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 313
    .line 314
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 315
    .line 316
    .line 317
    move-result-object v4

    .line 318
    sget-object v5, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 319
    .line 320
    invoke-virtual {v4, v5}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 321
    .line 322
    .line 323
    move-result v4

    .line 324
    if-nez v4, :cond_a

    .line 325
    .line 326
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 327
    .line 328
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 329
    .line 330
    .line 331
    move-result-object v4

    .line 332
    sget-object v5, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 333
    .line 334
    invoke-virtual {v4, v5}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 335
    .line 336
    .line 337
    move-result v4

    .line 338
    if-nez v4, :cond_a

    .line 339
    .line 340
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->i3()V

    .line 341
    .line 342
    .line 343
    :cond_a
    add-int/lit8 v3, v3, 0x1

    .line 344
    .line 345
    goto/16 :goto_0

    .line 346
    .line 347
    :cond_b
    return-void
.end method

.method public J(Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const v1, 0x7f0b02eb

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v1, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->D:Lcom/android/launcher3/dragndrop/O;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/O;->c()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isCircle()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->transformPageNum(I)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->validPageIndex(I)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 54
    .line 55
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->w:Lcom/android/launcher3/CellLayout;

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 59
    .line 60
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->w:Lcom/android/launcher3/CellLayout;

    .line 61
    .line 62
    :goto_1
    iget p1, p0, Lcom/android/launcher3/Workspace;->V:I

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    if-ne p1, v0, :cond_2

    .line 66
    .line 67
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->P:Z

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-boolean v0, p1, Lcom/android/launcher3/Hotseat;->K0:Z

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_2
    const/4 v1, 0x2

    .line 77
    if-ne p1, v1, :cond_3

    .line 78
    .line 79
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->Q:Z

    .line 80
    .line 81
    :cond_3
    :goto_2
    const/4 p1, 0x0

    .line 82
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->setCurrentDropLayout(Lcom/android/launcher3/CellLayout;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->setCurrentDragOverlappingLayout(Lcom/android/launcher3/CellLayout;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->D:Lcom/android/launcher3/dragndrop/O;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/O;->b()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method protected J0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/folder/u0;->a0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 9
    .line 10
    instance-of v1, v0, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    check-cast v0, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/apppairs/AppPairIcon;->getIconDrawableArea()Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->d(Ljava/lang/Integer;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->N:Landroid/view/View;

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public J2(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/d6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/d6;-><init>(Lcom/android/launcher3/Workspace;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected K0(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->L:Lcom/android/launcher3/c;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/c;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/android/launcher3/Workspace;->W:I

    .line 10
    .line 11
    iput p1, p0, Lcom/android/launcher3/Workspace;->a0:I

    .line 12
    .line 13
    return-void
.end method

.method public K2(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/n0;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 15
    .line 16
    check-cast p1, Lcom/android/launcher3/n0;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method L0()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/Workspace$k;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/Workspace$k;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public L2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->p:Z

    .line 3
    .line 4
    return-void
.end method

.method public M0()Lcom/android/launcher3/CellLayout;
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    iget v0, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 10
    .line 11
    if-gtz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    return-object v1

    .line 19
    :cond_2
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "clearTempRemoveAiFutureScreenIfNeed old mTempAiFutureScreenId="

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget v2, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, " mTempRemoveAiFutureScreen="

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    if-eqz v2, :cond_3

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    move v2, v3

    .line 47
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v2, "Launcher.Workspace"

    .line 55
    .line 56
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 60
    .line 61
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 62
    .line 63
    const/4 v1, -0x1

    .line 64
    iput v1, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 65
    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    :goto_2
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-ge v3, p0, :cond_5

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    instance-of v1, p0, Lcom/android/launcher3/widget/custom/future/d;

    .line 87
    .line 88
    if-eqz v1, :cond_4

    .line 89
    .line 90
    check-cast p0, Lcom/android/launcher3/widget/custom/future/d;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/d;->a0()Z

    .line 93
    .line 94
    .line 95
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_5
    return-object v0
.end method

.method public M2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->setDragMode(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public N2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lp1/a;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->q0:Lp1/e;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lp1/e;->e()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public O0()Lcom/android/launcher3/util/z0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->c3()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Lcom/android/launcher3/util/z0;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance v0, Lcom/android/launcher3/util/z0;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v1, Lcom/android/launcher3/f6;

    .line 21
    .line 22
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/f6;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/util/z0;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, v1}, Lcom/android/launcher3/Workspace;->b1(Ljava/util/function/Consumer;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public O2(Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p1, v1}, Lp1/a;->g(Lcom/android/launcher3/n0$a;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->q0:Lp1/e;

    .line 16
    .line 17
    invoke-virtual {p0}, Lp1/e;->e()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public P0(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public P2(Z)V
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "resetIconVisibility: page count: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "Launcher.Workspace"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    move v2, v0

    .line 29
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/4 v4, 0x0

    .line 34
    if-ge v2, v3, :cond_15

    .line 35
    .line 36
    invoke-static {}, Lx1/O;->k1()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 47
    .line 48
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getUpperRightCornerLayout()Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    if-eqz v3, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 59
    .line 60
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getUpperRightCornerLayout()Lcom/android/launcher3/bestie/UpperRightCornerLayout;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {v3}, Lx1/O;->C4(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    invoke-static {}, Lx1/O;->G3()Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const/high16 v5, 0x3f800000    # 1.0f

    .line 72
    .line 73
    if-nez v3, :cond_1

    .line 74
    .line 75
    invoke-static {}, Lx1/O;->J3()Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_4

    .line 80
    .line 81
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v6, "resetIconVisibility: cellLayout("

    .line 87
    .line 88
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v6, ")\'s alpha is "

    .line 95
    .line 96
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    check-cast v6, Lcom/android/launcher3/CellLayout;

    .line 104
    .line 105
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getAlpha()F

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 124
    .line 125
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getAlpha()F

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    invoke-direct {p0, v3, v5}, Lcom/android/launcher3/Workspace;->D1(FF)Z

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    if-nez v3, :cond_2

    .line 134
    .line 135
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 140
    .line 141
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 142
    .line 143
    .line 144
    :cond_2
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 149
    .line 150
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getScaleX()F

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    invoke-direct {p0, v3, v5}, Lcom/android/launcher3/Workspace;->D1(FF)Z

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    if-nez v3, :cond_3

    .line 159
    .line 160
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 165
    .line 166
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 167
    .line 168
    .line 169
    :cond_3
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 174
    .line 175
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getScaleY()F

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    invoke-direct {p0, v3, v5}, Lcom/android/launcher3/Workspace;->D1(FF)Z

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    if-nez v3, :cond_4

    .line 184
    .line 185
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 190
    .line 191
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 192
    .line 193
    .line 194
    :cond_4
    invoke-virtual {p0, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 199
    .line 200
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    if-nez v3, :cond_5

    .line 205
    .line 206
    const-string v3, "resetIconVisibility: layout is null."

    .line 207
    .line 208
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    .line 210
    .line 211
    goto/16 :goto_a

    .line 212
    .line 213
    :cond_5
    new-instance v6, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 216
    .line 217
    .line 218
    const-string v7, "resetIconVisibility: layout alpha = "

    .line 219
    .line 220
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getAlpha()F

    .line 224
    .line 225
    .line 226
    move-result v7

    .line 227
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v6

    .line 234
    invoke-static {v1, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    .line 236
    .line 237
    invoke-static {v3}, Lx1/O;->C4(Landroid/view/View;)V

    .line 238
    .line 239
    .line 240
    move v6, v0

    .line 241
    :goto_1
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 242
    .line 243
    .line 244
    move-result v7

    .line 245
    if-ge v6, v7, :cond_14

    .line 246
    .line 247
    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v7

    .line 251
    instance-of v8, v7, Lcom/android/launcher3/folder/FolderIcon;

    .line 252
    .line 253
    const-string v9, "resetIconVisibility: item = "

    .line 254
    .line 255
    if-nez v8, :cond_8

    .line 256
    .line 257
    instance-of v10, v7, Lcom/android/launcher3/BubbleTextView;

    .line 258
    .line 259
    if-nez v10, :cond_8

    .line 260
    .line 261
    instance-of v10, v7, Lcom/android/launcher3/widget/T;

    .line 262
    .line 263
    if-eqz v10, :cond_6

    .line 264
    .line 265
    goto :goto_3

    .line 266
    :cond_6
    new-instance v8, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    if-nez v7, :cond_7

    .line 275
    .line 276
    move-object v7, v4

    .line 277
    goto :goto_2

    .line 278
    :cond_7
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 279
    .line 280
    .line 281
    move-result-object v7

    .line 282
    :goto_2
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v7

    .line 289
    invoke-static {v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    .line 291
    .line 292
    goto/16 :goto_9

    .line 293
    .line 294
    :cond_8
    :goto_3
    iget-object v10, p0, Lcom/android/launcher3/Workspace;->z0:Landroid/view/View;

    .line 295
    .line 296
    if-ne v7, v10, :cond_c

    .line 297
    .line 298
    new-instance v8, Ljava/lang/StringBuilder;

    .line 299
    .line 300
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    if-nez v7, :cond_9

    .line 307
    .line 308
    move-object v9, v4

    .line 309
    goto :goto_4

    .line 310
    :cond_9
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 311
    .line 312
    .line 313
    move-result-object v9

    .line 314
    :goto_4
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    const-string v9, ", mResetIconVisibilityIgnoreView = "

    .line 318
    .line 319
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    iget-object v9, p0, Lcom/android/launcher3/Workspace;->z0:Landroid/view/View;

    .line 323
    .line 324
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    const-string v9, ", won\'t call resetViewVisibilityTranslation("

    .line 328
    .line 329
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    if-nez v7, :cond_a

    .line 333
    .line 334
    move-object v9, v4

    .line 335
    goto :goto_5

    .line 336
    :cond_a
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    .line 337
    .line 338
    .line 339
    move-result v9

    .line 340
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 341
    .line 342
    .line 343
    move-result-object v9

    .line 344
    :goto_5
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    const-string v9, "/"

    .line 348
    .line 349
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    if-nez v7, :cond_b

    .line 353
    .line 354
    move-object v7, v4

    .line 355
    goto :goto_6

    .line 356
    :cond_b
    invoke-virtual {v7}, Landroid/view/View;->getAlpha()F

    .line 357
    .line 358
    .line 359
    move-result v7

    .line 360
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 361
    .line 362
    .line 363
    move-result-object v7

    .line 364
    :goto_6
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    const-string v7, ")"

    .line 368
    .line 369
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v7

    .line 376
    invoke-static {v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    .line 378
    .line 379
    goto/16 :goto_9

    .line 380
    .line 381
    :cond_c
    iget-object v9, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 382
    .line 383
    if-eqz v9, :cond_e

    .line 384
    .line 385
    iget-object v9, v9, Lc1/a;->e:Landroid/view/View;

    .line 386
    .line 387
    if-ne v7, v9, :cond_e

    .line 388
    .line 389
    if-eqz p1, :cond_e

    .line 390
    .line 391
    new-instance v8, Ljava/lang/StringBuilder;

    .line 392
    .line 393
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 394
    .line 395
    .line 396
    const-string v9, "resetIconVisibility: item == mDragInfo.cell , Alpha = "

    .line 397
    .line 398
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    if-nez v7, :cond_d

    .line 402
    .line 403
    move-object v7, v4

    .line 404
    goto :goto_7

    .line 405
    :cond_d
    invoke-virtual {v7}, Landroid/view/View;->getAlpha()F

    .line 406
    .line 407
    .line 408
    move-result v7

    .line 409
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 410
    .line 411
    .line 412
    move-result-object v7

    .line 413
    :goto_7
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v7

    .line 420
    invoke-static {v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    .line 422
    .line 423
    goto :goto_9

    .line 424
    :cond_e
    invoke-static {v7}, Lx1/O;->C4(Landroid/view/View;)V

    .line 425
    .line 426
    .line 427
    iget-object v9, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 428
    .line 429
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 430
    .line 431
    .line 432
    move-result-object v9

    .line 433
    iget-object v9, v9, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 434
    .line 435
    iget-boolean v9, v9, Lcom/android/launcher3/r4;->k:Z

    .line 436
    .line 437
    if-nez v9, :cond_11

    .line 438
    .line 439
    instance-of v9, v7, Lcom/android/launcher3/BubbleTextView;

    .line 440
    .line 441
    if-eqz v9, :cond_f

    .line 442
    .line 443
    move-object v8, v7

    .line 444
    check-cast v8, Lcom/android/launcher3/BubbleTextView;

    .line 445
    .line 446
    invoke-virtual {v8, v5}, Lcom/android/launcher3/BubbleTextView;->setTextAlpha(F)V

    .line 447
    .line 448
    .line 449
    goto :goto_8

    .line 450
    :cond_f
    if-eqz v8, :cond_10

    .line 451
    .line 452
    move-object v8, v7

    .line 453
    check-cast v8, Lcom/android/launcher3/folder/FolderIcon;

    .line 454
    .line 455
    invoke-virtual {v8}, Lcom/android/launcher3/folder/FolderIcon;->getFolderName()Lcom/android/launcher3/BubbleTextView;

    .line 456
    .line 457
    .line 458
    move-result-object v8

    .line 459
    invoke-virtual {v8, v5}, Lcom/android/launcher3/BubbleTextView;->setTextAlpha(F)V

    .line 460
    .line 461
    .line 462
    goto :goto_8

    .line 463
    :cond_10
    instance-of v8, v7, Lcom/android/launcher3/widget/T;

    .line 464
    .line 465
    if-eqz v8, :cond_11

    .line 466
    .line 467
    move-object v8, v7

    .line 468
    check-cast v8, Lcom/android/launcher3/widget/T;

    .line 469
    .line 470
    invoke-virtual {v8, v5}, Lcom/android/launcher3/widget/T;->setWidgetTitleAlpha(F)V

    .line 471
    .line 472
    .line 473
    :cond_11
    :goto_8
    invoke-virtual {v7}, Landroid/view/View;->getScaleX()F

    .line 474
    .line 475
    .line 476
    move-result v8

    .line 477
    invoke-direct {p0, v8, v5}, Lcom/android/launcher3/Workspace;->D1(FF)Z

    .line 478
    .line 479
    .line 480
    move-result v8

    .line 481
    if-nez v8, :cond_12

    .line 482
    .line 483
    invoke-virtual {v7, v5}, Landroid/view/View;->setScaleX(F)V

    .line 484
    .line 485
    .line 486
    :cond_12
    invoke-virtual {v7}, Landroid/view/View;->getScaleY()F

    .line 487
    .line 488
    .line 489
    move-result v8

    .line 490
    invoke-direct {p0, v8, v5}, Lcom/android/launcher3/Workspace;->D1(FF)Z

    .line 491
    .line 492
    .line 493
    move-result v8

    .line 494
    if-nez v8, :cond_13

    .line 495
    .line 496
    invoke-virtual {v7, v5}, Landroid/view/View;->setScaleY(F)V

    .line 497
    .line 498
    .line 499
    :cond_13
    :goto_9
    add-int/lit8 v6, v6, 0x1

    .line 500
    .line 501
    goto/16 :goto_1

    .line 502
    .line 503
    :cond_14
    :goto_a
    add-int/lit8 v2, v2, 0x1

    .line 504
    .line 505
    goto/16 :goto_0

    .line 506
    .line 507
    :cond_15
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 508
    .line 509
    .line 510
    move-result-object v2

    .line 511
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 512
    .line 513
    .line 514
    move-result-object v2

    .line 515
    if-eqz v2, :cond_19

    .line 516
    .line 517
    move v3, v0

    .line 518
    :goto_b
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 519
    .line 520
    .line 521
    move-result v5

    .line 522
    if-ge v3, v5, :cond_19

    .line 523
    .line 524
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 525
    .line 526
    .line 527
    move-result-object v5

    .line 528
    iget-object v6, p0, Lcom/android/launcher3/Workspace;->z0:Landroid/view/View;

    .line 529
    .line 530
    if-ne v5, v6, :cond_16

    .line 531
    .line 532
    goto :goto_d

    .line 533
    :cond_16
    iget-object v6, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 534
    .line 535
    if-eqz v6, :cond_18

    .line 536
    .line 537
    iget-object v6, v6, Lc1/a;->e:Landroid/view/View;

    .line 538
    .line 539
    if-ne v5, v6, :cond_18

    .line 540
    .line 541
    if-eqz p1, :cond_18

    .line 542
    .line 543
    new-instance v6, Ljava/lang/StringBuilder;

    .line 544
    .line 545
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 546
    .line 547
    .line 548
    const-string v7, "resetIconVisibility: child == mDragInfo.cell  , Alpha = "

    .line 549
    .line 550
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    .line 552
    .line 553
    if-nez v5, :cond_17

    .line 554
    .line 555
    move-object v5, v4

    .line 556
    goto :goto_c

    .line 557
    :cond_17
    invoke-virtual {v5}, Landroid/view/View;->getAlpha()F

    .line 558
    .line 559
    .line 560
    move-result v5

    .line 561
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 562
    .line 563
    .line 564
    move-result-object v5

    .line 565
    :goto_c
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 566
    .line 567
    .line 568
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 569
    .line 570
    .line 571
    move-result-object v5

    .line 572
    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    .line 574
    .line 575
    goto :goto_d

    .line 576
    :cond_18
    invoke-static {v5}, Lx1/O;->C4(Landroid/view/View;)V

    .line 577
    .line 578
    .line 579
    :goto_d
    add-int/lit8 v3, v3, 0x1

    .line 580
    .line 581
    goto :goto_b

    .line 582
    :cond_19
    invoke-static {}, Lx1/O;->C3()Z

    .line 583
    .line 584
    .line 585
    move-result p1

    .line 586
    if-eqz p1, :cond_1b

    .line 587
    .line 588
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 589
    .line 590
    .line 591
    move-result-object p1

    .line 592
    invoke-virtual {p1}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 593
    .line 594
    .line 595
    move-result-object p1

    .line 596
    if-eqz p1, :cond_1b

    .line 597
    .line 598
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 599
    .line 600
    .line 601
    move-result-object p1

    .line 602
    invoke-virtual {p1}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 603
    .line 604
    .line 605
    move-result-object p1

    .line 606
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 607
    .line 608
    .line 609
    move-result-object p1

    .line 610
    move v1, v0

    .line 611
    :goto_e
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 612
    .line 613
    .line 614
    move-result v2

    .line 615
    if-ge v1, v2, :cond_1b

    .line 616
    .line 617
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 618
    .line 619
    .line 620
    move-result-object v2

    .line 621
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->z0:Landroid/view/View;

    .line 622
    .line 623
    if-ne v2, v3, :cond_1a

    .line 624
    .line 625
    goto :goto_f

    .line 626
    :cond_1a
    invoke-static {v2}, Lx1/O;->C4(Landroid/view/View;)V

    .line 627
    .line 628
    .line 629
    :goto_f
    add-int/lit8 v1, v1, 0x1

    .line 630
    .line 631
    goto :goto_e

    .line 632
    :cond_1b
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 633
    .line 634
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 635
    .line 636
    .line 637
    move-result-object p1

    .line 638
    if-eqz p1, :cond_1c

    .line 639
    .line 640
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 641
    .line 642
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 643
    .line 644
    .line 645
    move-result-object p1

    .line 646
    invoke-static {p1}, Lx1/O;->C4(Landroid/view/View;)V

    .line 647
    .line 648
    .line 649
    :cond_1c
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 650
    .line 651
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 652
    .line 653
    .line 654
    move-result-object p1

    .line 655
    if-eqz p1, :cond_1d

    .line 656
    .line 657
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 658
    .line 659
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 660
    .line 661
    .line 662
    move-result-object p1

    .line 663
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 664
    .line 665
    .line 666
    move-result-object p1

    .line 667
    if-eqz p1, :cond_1d

    .line 668
    .line 669
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 670
    .line 671
    .line 672
    move-result-object p1

    .line 673
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->k0()Z

    .line 674
    .line 675
    .line 676
    move-result p1

    .line 677
    if-nez p1, :cond_1d

    .line 678
    .line 679
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 680
    .line 681
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 682
    .line 683
    .line 684
    move-result-object p1

    .line 685
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 686
    .line 687
    .line 688
    move-result-object p1

    .line 689
    invoke-static {p1}, Lx1/O;->C4(Landroid/view/View;)V

    .line 690
    .line 691
    .line 692
    :cond_1d
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 693
    .line 694
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 695
    .line 696
    .line 697
    move-result-object p1

    .line 698
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 699
    .line 700
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->k:Z

    .line 701
    .line 702
    if-eqz p1, :cond_1e

    .line 703
    .line 704
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 705
    .line 706
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 707
    .line 708
    .line 709
    move-result-object p1

    .line 710
    invoke-static {p1}, Lx1/O;->C4(Landroid/view/View;)V

    .line 711
    .line 712
    .line 713
    :cond_1e
    invoke-static {p0}, Lx1/O;->C4(Landroid/view/View;)V

    .line 714
    .line 715
    .line 716
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 717
    .line 718
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 719
    .line 720
    .line 721
    move-result-object p1

    .line 722
    if-eqz p1, :cond_1f

    .line 723
    .line 724
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 725
    .line 726
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 727
    .line 728
    .line 729
    move-result-object p0

    .line 730
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/ScrimView;->setBackgroundColor(I)V

    .line 731
    .line 732
    .line 733
    :cond_1f
    return-void
.end method

.method public Q2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/android/launcher3/Workspace;->d0:F

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->setScaleX(F)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/Workspace;->d0:F

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method R0(Landroid/view/View;ILcom/android/launcher3/CellLayout;[IFZLcom/android/launcher3/n0$a;)Z
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p3

    .line 4
    .line 5
    move-object/from16 v9, p7

    .line 6
    .line 7
    new-instance v10, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    iget-object v3, v9, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 15
    .line 16
    iget v4, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 17
    .line 18
    iget v3, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 19
    .line 20
    invoke-virtual {v1, v4, v3}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 21
    .line 22
    .line 23
    invoke-virtual/range {p3 .. p4}, Lcom/android/launcher3/CellLayout;->L([I)F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    cmpl-float v1, p5, v1

    .line 28
    .line 29
    const/4 v11, 0x0

    .line 30
    if-lez v1, :cond_0

    .line 31
    .line 32
    return v11

    .line 33
    :cond_0
    aget v1, p4, v11

    .line 34
    .line 35
    const/4 v12, 0x1

    .line 36
    aget v3, p4, v12

    .line 37
    .line 38
    invoke-virtual {v2, v1, v3}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v13

    .line 42
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    iget-object v1, v1, Lc1/a;->e:Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 53
    .line 54
    iget v4, v3, Lcom/android/launcher3/util/C;->a:I

    .line 55
    .line 56
    aget v5, p4, v11

    .line 57
    .line 58
    if-ne v4, v5, :cond_1

    .line 59
    .line 60
    iget v3, v3, Lcom/android/launcher3/util/C;->b:I

    .line 61
    .line 62
    aget v4, p4, v12

    .line 63
    .line 64
    if-ne v3, v4, :cond_1

    .line 65
    .line 66
    if-ne v1, v2, :cond_1

    .line 67
    .line 68
    move v1, v12

    .line 69
    goto :goto_0

    .line 70
    :cond_1
    move v1, v11

    .line 71
    :goto_0
    if-eqz v13, :cond_b

    .line 72
    .line 73
    if-nez v1, :cond_b

    .line 74
    .line 75
    iget-boolean v1, v0, Lcom/android/launcher3/Workspace;->P:Z

    .line 76
    .line 77
    if-nez v1, :cond_2

    .line 78
    .line 79
    goto/16 :goto_5

    .line 80
    .line 81
    :cond_2
    iput-boolean v11, v0, Lcom/android/launcher3/Workspace;->P:Z

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-boolean v11, v1, Lcom/android/launcher3/Hotseat;->K0:Z

    .line 88
    .line 89
    const/16 v1, -0x65

    .line 90
    .line 91
    move/from16 v3, p2

    .line 92
    .line 93
    if-ne v3, v1, :cond_3

    .line 94
    .line 95
    iput-boolean v12, v0, Lcom/android/launcher3/Workspace;->A0:Z

    .line 96
    .line 97
    :cond_3
    invoke-virtual {v0, v2}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    invoke-virtual {v13}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {v1}, Lcom/android/launcher3/folder/Folder;->t2(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-static {v5}, Lcom/android/launcher3/folder/Folder;->t2(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-eqz v1, :cond_b

    .line 118
    .line 119
    if-eqz v5, :cond_b

    .line 120
    .line 121
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    move-object v14, v1

    .line 126
    check-cast v14, Lcom/android/launcher3/model/data/y;

    .line 127
    .line 128
    invoke-virtual {v13}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    move-object v15, v1

    .line 133
    check-cast v15, Lcom/android/launcher3/model/data/y;

    .line 134
    .line 135
    iget v1, v14, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 136
    .line 137
    const-string v5, "Launcher.Workspace"

    .line 138
    .line 139
    if-ne v1, v12, :cond_4

    .line 140
    .line 141
    iget v1, v14, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 142
    .line 143
    if-ne v1, v12, :cond_4

    .line 144
    .line 145
    iget v1, v15, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 146
    .line 147
    if-ne v1, v12, :cond_4

    .line 148
    .line 149
    iget v1, v15, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 150
    .line 151
    if-eq v1, v12, :cond_5

    .line 152
    .line 153
    :cond_4
    move-object v12, v5

    .line 154
    goto/16 :goto_4

    .line 155
    .line 156
    :cond_5
    iput-boolean v11, v15, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 157
    .line 158
    if-nez p6, :cond_6

    .line 159
    .line 160
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 161
    .line 162
    if-eqz v1, :cond_6

    .line 163
    .line 164
    iget-object v1, v1, Lc1/a;->e:Landroid/view/View;

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    if-eqz v1, :cond_6

    .line 171
    .line 172
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 173
    .line 174
    iget-object v6, v6, Lc1/a;->e:Landroid/view/View;

    .line 175
    .line 176
    invoke-virtual {v1, v6}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 177
    .line 178
    .line 179
    :cond_6
    new-instance v1, Landroid/graphics/Rect;

    .line 180
    .line 181
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 182
    .line 183
    .line 184
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 185
    .line 186
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    invoke-virtual {v6, v13, v1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 191
    .line 192
    .line 193
    move-result v16

    .line 194
    invoke-virtual {v2, v13}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 195
    .line 196
    .line 197
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->k0:Lcom/android/launcher3/logging/StatsLogManager;

    .line 198
    .line 199
    invoke-virtual {v6}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 200
    .line 201
    .line 202
    move-result-object v6

    .line 203
    invoke-interface {v6, v15}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 204
    .line 205
    .line 206
    move-result-object v6

    .line 207
    iget-object v7, v9, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 208
    .line 209
    invoke-interface {v6, v7}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 210
    .line 211
    .line 212
    move-result-object v6

    .line 213
    sget-object v7, Lcom/android/launcher3/logging/StatsLogManager$e;->r:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 214
    .line 215
    invoke-interface {v6, v7}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 219
    .line 220
    .line 221
    move-result-object v6

    .line 222
    const v7, 0x7f140176

    .line 223
    .line 224
    .line 225
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    move-object v6, v1

    .line 230
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 231
    .line 232
    move-object v8, v5

    .line 233
    aget v5, p4, v11

    .line 234
    .line 235
    aget v17, p4, v12

    .line 236
    .line 237
    move/from16 p5, v17

    .line 238
    .line 239
    move-object/from16 v17, v6

    .line 240
    .line 241
    move/from16 v6, p5

    .line 242
    .line 243
    move/from16 p5, v12

    .line 244
    .line 245
    move-object v12, v8

    .line 246
    move-object/from16 v8, p1

    .line 247
    .line 248
    invoke-virtual/range {v1 .. v8}, Lcom/android/launcher3/C2;->X0(Lcom/android/launcher3/CellLayout;IIIILjava/lang/String;Landroid/view/View;)Lcom/android/launcher3/folder/FolderIcon;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    move-object v8, v7

    .line 253
    const/4 v2, -0x1

    .line 254
    iput v2, v15, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 255
    .line 256
    iput v2, v15, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 257
    .line 258
    iput v2, v14, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 259
    .line 260
    iput v2, v14, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 261
    .line 262
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 263
    .line 264
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    invoke-virtual {v2}, Lcom/android/launcher3/G4;->q()Z

    .line 269
    .line 270
    .line 271
    move-result v2

    .line 272
    if-eqz v2, :cond_8

    .line 273
    .line 274
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 275
    .line 276
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-virtual {v2}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 285
    .line 286
    .line 287
    move-result-object v12

    .line 288
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 289
    .line 290
    .line 291
    move-result v2

    .line 292
    if-eqz v2, :cond_7

    .line 293
    .line 294
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 299
    .line 300
    invoke-virtual {v2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 305
    .line 306
    invoke-virtual {v2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v4

    .line 310
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 311
    .line 312
    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 316
    .line 317
    invoke-virtual {v4, v2, v3, v11}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 318
    .line 319
    .line 320
    goto :goto_1

    .line 321
    :cond_7
    move-object v5, v9

    .line 322
    move-object v4, v10

    .line 323
    move-object v3, v13

    .line 324
    move-object v2, v15

    .line 325
    move/from16 v7, v16

    .line 326
    .line 327
    move-object/from16 v6, v17

    .line 328
    .line 329
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/folder/FolderIcon;->d0(Lcom/android/launcher3/model/data/y;Landroid/view/View;Ljava/util/ArrayList;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;F)V

    .line 330
    .line 331
    .line 332
    goto :goto_3

    .line 333
    :cond_8
    move-object v5, v9

    .line 334
    move-object v3, v13

    .line 335
    move-object v2, v15

    .line 336
    move/from16 v7, v16

    .line 337
    .line 338
    move-object/from16 v6, v17

    .line 339
    .line 340
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 341
    .line 342
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 343
    .line 344
    .line 345
    move-result-object v4

    .line 346
    iget-boolean v4, v4, Lcom/android/launcher3/X3;->B0:Z

    .line 347
    .line 348
    if-eqz v4, :cond_9

    .line 349
    .line 350
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 351
    .line 352
    invoke-virtual {v4, v1, v5}, Lcom/android/launcher3/folder/u0;->V0(Lcom/android/launcher3/folder/FolderIcon;Lcom/android/launcher3/n0$a;)V

    .line 353
    .line 354
    .line 355
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 356
    .line 357
    invoke-virtual {v1, v4}, Lcom/android/launcher3/folder/FolderIcon;->setFolderBackground(Lcom/android/launcher3/folder/u0;)V

    .line 358
    .line 359
    .line 360
    new-instance v4, Lcom/android/launcher3/folder/u0;

    .line 361
    .line 362
    iget-object v9, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 363
    .line 364
    invoke-direct {v4, v9}, Lcom/android/launcher3/folder/u0;-><init>(Landroid/content/Context;)V

    .line 365
    .line 366
    .line 367
    iput-object v4, v0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 368
    .line 369
    move-object v4, v14

    .line 370
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/folder/FolderIcon;->e0(Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;F)V

    .line 371
    .line 372
    .line 373
    goto :goto_2

    .line 374
    :cond_9
    move-object v4, v14

    .line 375
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 376
    .line 377
    invoke-virtual {v1, v5}, Lcom/android/launcher3/folder/FolderIcon;->setFolderBackground(Lcom/android/launcher3/folder/u0;)V

    .line 378
    .line 379
    .line 380
    new-instance v5, Lcom/android/launcher3/folder/u0;

    .line 381
    .line 382
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 383
    .line 384
    .line 385
    move-result-object v9

    .line 386
    invoke-direct {v5, v9}, Lcom/android/launcher3/folder/u0;-><init>(Landroid/content/Context;)V

    .line 387
    .line 388
    .line 389
    iput-object v5, v0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 390
    .line 391
    move-object/from16 v5, p7

    .line 392
    .line 393
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/folder/FolderIcon;->e0(Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;F)V

    .line 394
    .line 395
    .line 396
    :goto_2
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 397
    .line 398
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 399
    .line 400
    .line 401
    move-result-object v3

    .line 402
    invoke-virtual {v3}, Lcom/android/launcher3/q4;->a0()Z

    .line 403
    .line 404
    .line 405
    move-result v3

    .line 406
    if-eqz v3, :cond_a

    .line 407
    .line 408
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 409
    .line 410
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 411
    .line 412
    .line 413
    move-result-object v3

    .line 414
    invoke-virtual {v3}, Lcom/android/launcher3/G4;->o()Z

    .line 415
    .line 416
    .line 417
    move-result v3

    .line 418
    if-eqz v3, :cond_a

    .line 419
    .line 420
    const-string v3, "createUserFolderIfNecessary not isMoreDragMode isDragingViewsEnble removeDraggingViewIfNecessary"

    .line 421
    .line 422
    invoke-static {v12, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    .line 424
    .line 425
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 426
    .line 427
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 428
    .line 429
    .line 430
    move-result-object v3

    .line 431
    invoke-virtual {v3, v2}, Lcom/android/launcher3/G4;->A(Lcom/android/launcher3/model/data/y;)V

    .line 432
    .line 433
    .line 434
    :cond_a
    :goto_3
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 435
    .line 436
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getId()I

    .line 449
    .line 450
    .line 451
    move-result v1

    .line 452
    invoke-virtual {v0, v1, v11, v8}, Lcom/android/launcher3/H5;->p1(IILjava/lang/String;)V

    .line 453
    .line 454
    .line 455
    return p5

    .line 456
    :goto_4
    const-string v0, "createUserFolderIfNecessary: icon span is not 1*1."

    .line 457
    .line 458
    invoke-static {v12, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    .line 460
    .line 461
    :cond_b
    :goto_5
    return v11
.end method

.method public R2(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->b0:Landroid/util/SparseArray;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->c0:Lcom/android/launcher3/util/x0;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->b0:Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lcom/android/launcher3/CellLayout;->v0(Landroid/util/SparseArray;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public S2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->c0:Lcom/android/launcher3/util/x0;

    .line 9
    .line 10
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->R2(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->c0:Lcom/android/launcher3/util/x0;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->clear()V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->b0:Landroid/util/SparseArray;

    .line 29
    .line 30
    return-void
.end method

.method public T0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->p:Z

    .line 3
    .line 4
    return-void
.end method

.method T2(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/Workspace;->s:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/Workspace;->t:I

    .line 6
    .line 7
    if-eq p2, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iput p1, p0, Lcom/android/launcher3/Workspace;->s:I

    .line 12
    .line 13
    iput p2, p0, Lcom/android/launcher3/Workspace;->t:I

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->setDragMode(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method U0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public V0(Z)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    const v0, 0x70000010

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    instance-of v0, p0, Lcom/android/launcher3/widget/o;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "MenuWidgetFloatingViewOpen: close first , close = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "Launcher.Workspace"

    .line 34
    .line 35
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->shrink(Z)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public V2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScaleX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/android/launcher3/Workspace;->d0:F

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->j0:Lcom/android/launcher3/N6;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/N6;->e()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->setScaleX(F)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->j0:Lcom/android/launcher3/N6;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/N6;->e()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public X2(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/Workspace$m;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/Workspace$m;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/L6;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/launcher3/V3;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {v1, v2, p1}, Lcom/android/launcher3/V3;->H(Lcom/android/launcher3/C2;Lcom/android/launcher3/V3;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->j0:Lcom/android/launcher3/N6;

    .line 25
    .line 26
    invoke-virtual {v1, p1, p2, p3}, Lcom/android/launcher3/N6;->j(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 27
    .line 28
    .line 29
    sget p2, Lcom/android/launcher3/V3;->e:I

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Lcom/android/launcher3/V3;->hasFlag(I)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    iput-boolean p1, p0, Lcom/android/launcher3/Workspace;->i0:Z

    .line 39
    .line 40
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->invalidate()V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x2

    .line 44
    new-array p0, p0, [F

    .line 45
    .line 46
    fill-array-data p0, :array_0

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p3, p0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public Y0(Lcom/android/launcher3/CellLayout;IIII)Landroid/graphics/Rect;
    .locals 2

    .line 1
    move-object p0, p1

    .line 2
    move p1, p2

    .line 3
    move p2, p3

    .line 4
    move p3, p4

    .line 5
    move p4, p5

    .line 6
    new-instance p5, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p5}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual/range {p0 .. p5}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    return-object p5

    .line 17
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v1, "estimateItemPosition: cl = "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, ",hCell="

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, ",vCell="

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, ",hSpan="

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p0, ",vSpan="

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "Launcher.Workspace"

    .line 67
    .line 68
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    return-object p5
.end method

.method protected Y2()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/Workspace$e;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/Workspace$e;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Z0(Lcom/android/launcher3/model/data/y;)[I
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const v2, 0x7fffffff

    .line 9
    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, 0x0

    .line 13
    if-lez v1, :cond_5

    .line 14
    .line 15
    invoke-virtual {p0, v4}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    move-object v6, v1

    .line 20
    check-cast v6, Lcom/android/launcher3/CellLayout;

    .line 21
    .line 22
    iget v1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 23
    .line 24
    const/4 v5, 0x4

    .line 25
    if-ne v1, v5, :cond_0

    .line 26
    .line 27
    move v1, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v1, v4

    .line 30
    :goto_0
    iget v9, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 31
    .line 32
    iget v10, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 33
    .line 34
    const/4 v7, 0x0

    .line 35
    const/4 v8, 0x0

    .line 36
    move-object v5, p0

    .line 37
    invoke-virtual/range {v5 .. v10}, Lcom/android/launcher3/Workspace;->Y0(Lcom/android/launcher3/CellLayout;IIII)Landroid/graphics/Rect;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    iget-object p1, v5, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const/4 v5, 0x0

    .line 50
    invoke-virtual {p1, v5}, Lcom/android/launcher3/h0;->Y(Lcom/android/launcher3/model/data/y;)Landroid/graphics/PointF;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget v5, p1, Landroid/graphics/PointF;->x:F

    .line 55
    .line 56
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 57
    .line 58
    invoke-static {p0, v5, p1}, Lcom/android/launcher3/N5;->d0(Landroid/graphics/Rect;FF)F

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 64
    .line 65
    :goto_1
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    aput v5, v0, v4

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    aput p0, v0, v3

    .line 76
    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    aget v1, v0, v4

    .line 80
    .line 81
    int-to-float v1, v1

    .line 82
    div-float/2addr v1, p1

    .line 83
    float-to-int v1, v1

    .line 84
    aput v1, v0, v4

    .line 85
    .line 86
    int-to-float p0, p0

    .line 87
    div-float/2addr p0, p1

    .line 88
    float-to-int p0, p0

    .line 89
    aput p0, v0, v3

    .line 90
    .line 91
    :cond_2
    aget p0, v0, v4

    .line 92
    .line 93
    const-string p1, "Launcher.Workspace"

    .line 94
    .line 95
    if-nez p0, :cond_3

    .line 96
    .line 97
    aput v2, v0, v4

    .line 98
    .line 99
    const-string p0, "estimateItemSize width is wrong!"

    .line 100
    .line 101
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    :cond_3
    aget p0, v0, v3

    .line 105
    .line 106
    if-nez p0, :cond_4

    .line 107
    .line 108
    aput v2, v0, v3

    .line 109
    .line 110
    const-string p0, "estimateItemSize height is wrong!"

    .line 111
    .line 112
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    :cond_4
    return-object v0

    .line 116
    :cond_5
    aput v2, v0, v4

    .line 117
    .line 118
    aput v2, v0, v3

    .line 119
    .line 120
    return-object v0
.end method

.method public Z1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/l3;->k(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a(F)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    iput v2, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->o0:Lz2/a$a;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-interface {v2}, Lz2/a$a;->f()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v2, v3

    .line 24
    :goto_0
    int-to-float v2, v2

    .line 25
    invoke-static {p1, v2}, Ljava/lang/Math;->max(FF)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 34
    .line 35
    invoke-static {p1, v1}, Ljava/lang/Float;->compare(FF)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/4 v4, 0x1

    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    iget-boolean v2, p0, Lcom/android/launcher3/Workspace;->f0:Z

    .line 43
    .line 44
    if-nez v2, :cond_3

    .line 45
    .line 46
    iput-boolean v4, p0, Lcom/android/launcher3/Workspace;->f0:Z

    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 49
    .line 50
    invoke-virtual {v2, v4}, Lcom/android/launcher3/C2;->T3(Z)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    iget v2, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 55
    .line 56
    invoke-static {v2, v0}, Ljava/lang/Float;->compare(FF)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-nez v2, :cond_3

    .line 61
    .line 62
    iget-boolean v2, p0, Lcom/android/launcher3/Workspace;->f0:Z

    .line 63
    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    iput-boolean v3, p0, Lcom/android/launcher3/Workspace;->f0:Z

    .line 67
    .line 68
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Lcom/android/launcher3/C2;->T3(Z)V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-boolean v2, p0, Lcom/android/launcher3/Workspace;->f0:Z

    .line 74
    .line 75
    if-nez v2, :cond_4

    .line 76
    .line 77
    iget v2, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 78
    .line 79
    invoke-static {v2, v0}, Ljava/lang/Float;->compare(FF)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_3

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    :goto_1
    move v4, v3

    .line 87
    :cond_4
    :goto_2
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->h0:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    move v5, v3

    .line 94
    :goto_3
    if-ge v5, v2, :cond_5

    .line 95
    .line 96
    iget-object v6, p0, Lcom/android/launcher3/Workspace;->h0:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    check-cast v6, Lz2/a$b;

    .line 103
    .line 104
    iget v7, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 105
    .line 106
    invoke-interface {v6, v7}, Lz2/a$b;->a(F)V

    .line 107
    .line 108
    .line 109
    add-int/lit8 v5, v5, 0x1

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_5
    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_6

    .line 117
    .line 118
    invoke-static {p1, v1}, Ljava/lang/Float;->compare(FF)I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_7

    .line 123
    .line 124
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    const-string v5, "onOverlayScrollChanged scroll= "

    .line 130
    .line 131
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v5, " isSlideOutMiBoardEnd="

    .line 138
    .line 139
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v5, " mOverlayProgress="

    .line 146
    .line 147
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget v5, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 151
    .line 152
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    const-string v5, "Launcher.Workspace"

    .line 160
    .line 161
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getValidateCurrentPage()I

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    invoke-static {v2, v5}, Lx1/c0;->h(Lcom/android/launcher3/C2;I)V

    .line 171
    .line 172
    .line 173
    :cond_7
    invoke-static {}, Lx1/O;->e2()Z

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    if-eqz v2, :cond_8

    .line 178
    .line 179
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 180
    .line 181
    instance-of v5, v2, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 182
    .line 183
    if-eqz v5, :cond_8

    .line 184
    .line 185
    invoke-static {v2}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    if-eqz v2, :cond_8

    .line 190
    .line 191
    invoke-virtual {v2, v3}, Lcom/android/launcher3/a;->close(Z)V

    .line 192
    .line 193
    .line 194
    :cond_8
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->V(Lcom/android/launcher3/Workspace;F)V

    .line 195
    .line 196
    .line 197
    iput p1, p0, Lcom/android/launcher3/Workspace;->D0:F

    .line 198
    .line 199
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    iget-object v5, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 204
    .line 205
    instance-of v6, v5, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 206
    .line 207
    if-eqz v6, :cond_c

    .line 208
    .line 209
    invoke-virtual {v5, v4}, Lcom/android/launcher3/C2;->G3(Z)Z

    .line 210
    .line 211
    .line 212
    move-result v5

    .line 213
    if-eqz v5, :cond_c

    .line 214
    .line 215
    iget-object v5, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 216
    .line 217
    invoke-static {v5}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 218
    .line 219
    .line 220
    move-result-object v5

    .line 221
    if-eqz v5, :cond_9

    .line 222
    .line 223
    invoke-static {v2, v0}, Ljava/lang/Float;->compare(FF)I

    .line 224
    .line 225
    .line 226
    move-result v5

    .line 227
    if-eqz v5, :cond_c

    .line 228
    .line 229
    :cond_9
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    if-eqz v5, :cond_a

    .line 234
    .line 235
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->k()Z

    .line 236
    .line 237
    .line 238
    move-result v5

    .line 239
    if-eqz v5, :cond_a

    .line 240
    .line 241
    cmpl-float p1, p1, v0

    .line 242
    .line 243
    if-gtz p1, :cond_b

    .line 244
    .line 245
    invoke-static {v2, v0}, Ljava/lang/Float;->compare(FF)I

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-nez p1, :cond_a

    .line 250
    .line 251
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    if-nez p1, :cond_a

    .line 256
    .line 257
    goto :goto_4

    .line 258
    :cond_a
    move v1, v2

    .line 259
    :cond_b
    :goto_4
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 260
    .line 261
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 262
    .line 263
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    invoke-virtual {p0, v1, v3, v4}, LP1/h;->v(FZZ)V

    .line 268
    .line 269
    .line 270
    :cond_c
    return-void
.end method

.method a1(IIIILcom/android/launcher3/CellLayout;[I)[I
    .locals 0

    .line 1
    move-object p0, p5

    .line 2
    move-object p5, p6

    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/android/launcher3/CellLayout;->G(IIII[I)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public announceForAccessibility(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method protected announcePageForAccessibility()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->p3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected b2(Lcom/android/launcher3/n0$a;FZIIII)V
    .locals 25

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v7, p1

    .line 4
    .line 5
    move/from16 v0, p6

    .line 6
    .line 7
    move/from16 v2, p7

    .line 8
    .line 9
    iget-object v11, v7, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    iget-object v3, v1, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 12
    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    :goto_0
    move-object/from16 v19, v3

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-object v3, v3, Lc1/a;->e:Landroid/view/View;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :goto_1
    iget-object v3, v1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    const v4, 0x7f0b032d

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    const/4 v4, 0x2

    .line 36
    const/16 v23, 0x0

    .line 37
    .line 38
    const/16 v24, 0x1

    .line 39
    .line 40
    if-nez p3, :cond_1

    .line 41
    .line 42
    new-array v0, v4, [I

    .line 43
    .line 44
    iget-object v12, v1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 45
    .line 46
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->C:[F

    .line 47
    .line 48
    aget v3, v2, v23

    .line 49
    .line 50
    float-to-int v13, v3

    .line 51
    aget v2, v2, v24

    .line 52
    .line 53
    float-to-int v14, v2

    .line 54
    iget v2, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 55
    .line 56
    iget v3, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 57
    .line 58
    iget-object v4, v1, Lcom/android/launcher3/Workspace;->r:[I

    .line 59
    .line 60
    const/16 v22, 0x0

    .line 61
    .line 62
    move/from16 v15, p4

    .line 63
    .line 64
    move/from16 v16, p5

    .line 65
    .line 66
    move-object/from16 v21, v0

    .line 67
    .line 68
    move/from16 v17, v2

    .line 69
    .line 70
    move/from16 v18, v3

    .line 71
    .line 72
    move-object/from16 v20, v4

    .line 73
    .line 74
    invoke-virtual/range {v12 .. v22}, Lcom/android/launcher3/CellLayout;->n0(IIIIIILandroid/view/View;[I[II)[I

    .line 75
    .line 76
    .line 77
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 78
    .line 79
    iget-object v0, v1, Lcom/android/launcher3/Workspace;->r:[I

    .line 80
    .line 81
    aget v3, v0, v23

    .line 82
    .line 83
    aget v4, v0, v24

    .line 84
    .line 85
    aget v5, v21, v23

    .line 86
    .line 87
    aget v6, v21, v24

    .line 88
    .line 89
    iget-object v8, v7, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 90
    .line 91
    iget-object v9, v1, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 92
    .line 93
    const/4 v10, 0x0

    .line 94
    invoke-virtual/range {v2 .. v10}, Lcom/android/launcher3/CellLayout;->F0(IIIILcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/y;Ln1/d;Z)V

    .line 95
    .line 96
    .line 97
    iget-object v0, v1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 98
    .line 99
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->C:[F

    .line 100
    .line 101
    aget v3, v2, v23

    .line 102
    .line 103
    float-to-int v3, v3

    .line 104
    aget v2, v2, v24

    .line 105
    .line 106
    float-to-int v2, v2

    .line 107
    iget v4, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 108
    .line 109
    iget v5, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 110
    .line 111
    iget-object v1, v1, Lcom/android/launcher3/Workspace;->r:[I

    .line 112
    .line 113
    move-object/from16 p0, v0

    .line 114
    .line 115
    move-object/from16 p6, v1

    .line 116
    .line 117
    move/from16 p2, v2

    .line 118
    .line 119
    move/from16 p1, v3

    .line 120
    .line 121
    move/from16 p3, v4

    .line 122
    .line 123
    move/from16 p4, v5

    .line 124
    .line 125
    move-object/from16 p5, v19

    .line 126
    .line 127
    invoke-virtual/range {p0 .. p6}, Lcom/android/launcher3/CellLayout;->a0(IIIILandroid/view/View;[I)Z

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_1
    iget v5, v1, Lcom/android/launcher3/Workspace;->V:I

    .line 132
    .line 133
    const/4 v6, 0x3

    .line 134
    if-eqz v5, :cond_2

    .line 135
    .line 136
    if-ne v5, v6, :cond_5

    .line 137
    .line 138
    :cond_2
    iget v5, v1, Lcom/android/launcher3/Workspace;->W:I

    .line 139
    .line 140
    if-ne v5, v0, :cond_3

    .line 141
    .line 142
    iget v5, v1, Lcom/android/launcher3/Workspace;->a0:I

    .line 143
    .line 144
    if-eq v5, v2, :cond_5

    .line 145
    .line 146
    :cond_3
    instance-of v5, v3, Ljava/lang/Boolean;

    .line 147
    .line 148
    if-eqz v5, :cond_5

    .line 149
    .line 150
    check-cast v3, Ljava/lang/Boolean;

    .line 151
    .line 152
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    if-eqz v3, :cond_5

    .line 157
    .line 158
    iget-object v3, v1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 159
    .line 160
    iget-object v5, v1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 161
    .line 162
    invoke-virtual {v3, v5}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-eqz v3, :cond_5

    .line 167
    .line 168
    invoke-static {}, Lx1/O;->C3()Z

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    if-nez v3, :cond_5

    .line 173
    .line 174
    iget-object v3, v1, Lcom/android/launcher3/Workspace;->L:Lcom/android/launcher3/c;

    .line 175
    .line 176
    invoke-virtual {v3}, Lcom/android/launcher3/c;->b()V

    .line 177
    .line 178
    .line 179
    iput v0, v1, Lcom/android/launcher3/Workspace;->W:I

    .line 180
    .line 181
    iput v2, v1, Lcom/android/launcher3/Workspace;->a0:I

    .line 182
    .line 183
    new-array v0, v4, [I

    .line 184
    .line 185
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 186
    .line 187
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-virtual {v2}, Lcom/android/launcher3/G4;->q()Z

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    if-nez v2, :cond_4

    .line 196
    .line 197
    iget-object v12, v1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 198
    .line 199
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->C:[F

    .line 200
    .line 201
    aget v3, v2, v23

    .line 202
    .line 203
    float-to-int v13, v3

    .line 204
    aget v2, v2, v24

    .line 205
    .line 206
    float-to-int v14, v2

    .line 207
    iget v2, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 208
    .line 209
    iget v3, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 210
    .line 211
    iget-object v4, v1, Lcom/android/launcher3/Workspace;->r:[I

    .line 212
    .line 213
    const/16 v22, 0x0

    .line 214
    .line 215
    move/from16 v15, p4

    .line 216
    .line 217
    move/from16 v16, p5

    .line 218
    .line 219
    move-object/from16 v21, v0

    .line 220
    .line 221
    move/from16 v17, v2

    .line 222
    .line 223
    move/from16 v18, v3

    .line 224
    .line 225
    move-object/from16 v20, v4

    .line 226
    .line 227
    invoke-virtual/range {v12 .. v22}, Lcom/android/launcher3/CellLayout;->n0(IIIIIILandroid/view/View;[I[II)[I

    .line 228
    .line 229
    .line 230
    new-instance v0, Lcom/android/launcher3/Workspace$l;

    .line 231
    .line 232
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->C:[F

    .line 233
    .line 234
    iget v5, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 235
    .line 236
    iget v6, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 237
    .line 238
    move-object/from16 v7, p1

    .line 239
    .line 240
    move/from16 v3, p4

    .line 241
    .line 242
    move/from16 v4, p5

    .line 243
    .line 244
    move-object/from16 v8, v19

    .line 245
    .line 246
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/Workspace$l;-><init>(Lcom/android/launcher3/Workspace;[FIIIILcom/android/launcher3/n0$a;Landroid/view/View;)V

    .line 247
    .line 248
    .line 249
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->L:Lcom/android/launcher3/c;

    .line 250
    .line 251
    invoke-virtual {v2, v0}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 252
    .line 253
    .line 254
    iget-object v0, v1, Lcom/android/launcher3/Workspace;->L:Lcom/android/launcher3/c;

    .line 255
    .line 256
    const-wide/16 v2, 0x0

    .line 257
    .line 258
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/c;->d(J)V

    .line 259
    .line 260
    .line 261
    :cond_4
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 262
    .line 263
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    new-instance v2, Lcom/android/launcher3/Workspace$g;

    .line 268
    .line 269
    invoke-direct {v2, v1}, Lcom/android/launcher3/Workspace$g;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 270
    .line 271
    .line 272
    const-wide/16 v3, 0x64

    .line 273
    .line 274
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_5
    iget v3, v1, Lcom/android/launcher3/Workspace;->V:I

    .line 279
    .line 280
    if-eqz v3, :cond_6

    .line 281
    .line 282
    if-ne v3, v6, :cond_9

    .line 283
    .line 284
    :cond_6
    iget v3, v1, Lcom/android/launcher3/Workspace;->W:I

    .line 285
    .line 286
    if-ne v3, v0, :cond_7

    .line 287
    .line 288
    iget v3, v1, Lcom/android/launcher3/Workspace;->a0:I

    .line 289
    .line 290
    if-eq v3, v2, :cond_9

    .line 291
    .line 292
    :cond_7
    iget-object v3, v1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 293
    .line 294
    iget-object v5, v1, Lcom/android/launcher3/Workspace;->r:[I

    .line 295
    .line 296
    iget v6, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 297
    .line 298
    iget v7, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 299
    .line 300
    invoke-virtual {v3, v5, v6, v7}, Lcom/android/launcher3/CellLayout;->Q([III)F

    .line 301
    .line 302
    .line 303
    move-result v3

    .line 304
    cmpg-float v3, p2, v3

    .line 305
    .line 306
    if-gez v3, :cond_9

    .line 307
    .line 308
    iget-object v3, v1, Lcom/android/launcher3/Workspace;->L:Lcom/android/launcher3/c;

    .line 309
    .line 310
    invoke-virtual {v3}, Lcom/android/launcher3/c;->b()V

    .line 311
    .line 312
    .line 313
    iput v0, v1, Lcom/android/launcher3/Workspace;->W:I

    .line 314
    .line 315
    iput v2, v1, Lcom/android/launcher3/Workspace;->a0:I

    .line 316
    .line 317
    new-array v0, v4, [I

    .line 318
    .line 319
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 320
    .line 321
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    invoke-virtual {v2}, Lcom/android/launcher3/G4;->q()Z

    .line 326
    .line 327
    .line 328
    move-result v2

    .line 329
    if-nez v2, :cond_9

    .line 330
    .line 331
    invoke-static {}, Lx1/O;->C3()Z

    .line 332
    .line 333
    .line 334
    move-result v2

    .line 335
    if-eqz v2, :cond_8

    .line 336
    .line 337
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 338
    .line 339
    instance-of v2, v2, Lcom/android/launcher3/Hotseat;

    .line 340
    .line 341
    if-eqz v2, :cond_8

    .line 342
    .line 343
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 344
    .line 345
    invoke-static {v2}, Lp1/f;->p(Lcom/android/launcher3/C2;)I

    .line 346
    .line 347
    .line 348
    move-result v2

    .line 349
    add-int/lit8 v2, v2, 0x1

    .line 350
    .line 351
    iget-object v3, v1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 352
    .line 353
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 354
    .line 355
    .line 356
    move-result-object v2

    .line 357
    const v4, 0x7f0b04bd

    .line 358
    .line 359
    .line 360
    invoke-virtual {v3, v4, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 361
    .line 362
    .line 363
    :cond_8
    iget-object v12, v1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 364
    .line 365
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->C:[F

    .line 366
    .line 367
    aget v3, v2, v23

    .line 368
    .line 369
    float-to-int v13, v3

    .line 370
    aget v2, v2, v24

    .line 371
    .line 372
    float-to-int v14, v2

    .line 373
    iget v2, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 374
    .line 375
    iget v3, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 376
    .line 377
    iget-object v4, v1, Lcom/android/launcher3/Workspace;->r:[I

    .line 378
    .line 379
    const/16 v22, 0x0

    .line 380
    .line 381
    move/from16 v15, p4

    .line 382
    .line 383
    move/from16 v16, p5

    .line 384
    .line 385
    move-object/from16 v21, v0

    .line 386
    .line 387
    move/from16 v17, v2

    .line 388
    .line 389
    move/from16 v18, v3

    .line 390
    .line 391
    move-object/from16 v20, v4

    .line 392
    .line 393
    invoke-virtual/range {v12 .. v22}, Lcom/android/launcher3/CellLayout;->n0(IIIIIILandroid/view/View;[I[II)[I

    .line 394
    .line 395
    .line 396
    new-instance v0, Lcom/android/launcher3/Workspace$l;

    .line 397
    .line 398
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->C:[F

    .line 399
    .line 400
    iget v5, v11, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 401
    .line 402
    iget v6, v11, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 403
    .line 404
    move-object/from16 v7, p1

    .line 405
    .line 406
    move/from16 v3, p4

    .line 407
    .line 408
    move/from16 v4, p5

    .line 409
    .line 410
    move-object/from16 v8, v19

    .line 411
    .line 412
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/Workspace$l;-><init>(Lcom/android/launcher3/Workspace;[FIIIILcom/android/launcher3/n0$a;Landroid/view/View;)V

    .line 413
    .line 414
    .line 415
    iget-object v2, v1, Lcom/android/launcher3/Workspace;->L:Lcom/android/launcher3/c;

    .line 416
    .line 417
    invoke-virtual {v2, v0}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 418
    .line 419
    .line 420
    iget-object v0, v1, Lcom/android/launcher3/Workspace;->L:Lcom/android/launcher3/c;

    .line 421
    .line 422
    const-wide/16 v1, 0x28a

    .line 423
    .line 424
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/c;->d(J)V

    .line 425
    .line 426
    .line 427
    :cond_9
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public c1(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/BubbleTextView;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/Workspace$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/Workspace$a;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/Workspace;->f1(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    instance-of p1, p0, Lcom/android/launcher3/BubbleTextView;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public c2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/Workspace;->f2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected canAnnouncePageDescription()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ljava/lang/Float;->compare(FF)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public computeScroll()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/V4;->computeScroll()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isCircle()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->g2()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->g2()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "com.zte.superwallpaper.planet"

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    :goto_0
    return-void

    .line 55
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/util/l3;->n()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getImportantForAccessibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain()Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-super {p0}, Landroid/view/ViewGroup;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public d2(Lcom/android/launcher3/util/Y0$a;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->getCurrentWorkspaceAndHotseatCellLayout()[Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {p0, v3, p1}, Lcom/android/launcher3/Workspace;->f2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    :goto_1
    return-void
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->E1()Z

    move-result v0

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->U:Z

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    move-result-object v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-le v0, v1, :cond_1

    .line 3
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    .line 4
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    goto :goto_0

    .line 5
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-le v0, v1, :cond_2

    goto/16 :goto_1

    .line 6
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 8
    :goto_0
    iget v3, p0, Lcom/android/launcher3/Workspace;->R:F

    sub-float v3, v0, v3

    .line 9
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 10
    iget v4, p0, Lcom/android/launcher3/Workspace;->S:F

    sub-float v4, v2, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const/4 v5, 0x0

    .line 11
    invoke-static {v3, v5}, Ljava/lang/Float;->compare(FF)I

    move-result v5

    if-nez v5, :cond_3

    goto/16 :goto_1

    :cond_3
    div-float v5, v4, v3

    float-to-double v6, v5

    .line 12
    invoke-static {v6, v7}, Ljava/lang/Math;->atan(D)D

    move-result-wide v6

    double-to-float v6, v6

    .line 13
    iget v7, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    int-to-float v8, v7

    cmpl-float v8, v3, v8

    if-gtz v8, :cond_4

    mul-int/lit8 v7, v7, 0x3

    int-to-float v7, v7

    cmpl-float v7, v4, v7

    if-lez v7, :cond_5

    .line 14
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->cancelCurrentPageLongPress()V

    .line 15
    iget-object v7, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    const/4 v8, 0x0

    invoke-interface {v7, v1, v8}, Lcom/android/launcher3/views/k;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "determineScrollingStart, cancelCurrentPageLongPress absDeltaX:"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " absDeltaY:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " slope:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " theta:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " X: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " Y: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Launcher.Workspace"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    const v0, 0x3f860a92

    cmpl-float v0, v6, v0

    if-lez v0, :cond_6

    goto :goto_1

    :cond_6
    const v0, 0x3f060a92

    cmpl-float v1, v6, v0

    if-lez v1, :cond_7

    sub-float/2addr v6, v0

    div-float/2addr v6, v0

    float-to-double v0, v6

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, 0x40800000    # 4.0f

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    .line 18
    invoke-super {p0, p1, v0}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;F)V

    return-void

    .line 19
    :cond_7
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;)V

    :cond_8
    :goto_1
    return-void
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;F)V
    .locals 1

    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->I1()Z

    move-result v0

    if-nez v0, :cond_0

    .line 21
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;F)V

    :cond_0
    return-void
.end method

.method protected dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->b0:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-void
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->E1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->dispatchUnhandledMove(Landroid/view/View;I)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->getWorkspaceAndHotseatCellLayouts()[Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/Workspace;->g2([Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public e3(ZLcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const v0, 0x7f14020b

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const v0, 0x7f1402db

    .line 8
    .line 9
    .line 10
    :goto_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget p1, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 13
    .line 14
    const/16 v1, -0x64

    .line 15
    .line 16
    if-eq p1, v1, :cond_2

    .line 17
    .line 18
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 30
    .line 31
    .line 32
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->k0:Lcom/android/launcher3/logging/StatsLogManager;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-eqz p3, :cond_3

    .line 43
    .line 44
    invoke-interface {p0, p3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    :cond_3
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->j2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 49
    .line 50
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method enableLayoutTransitions()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->k:Landroid/animation/LayoutTransition;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Lcom/android/launcher3/CellLayout;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->indexOfValue(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    return v0
.end method

.method public f2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Z
    .locals 8

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    move v1, p0

    .line 14
    :goto_0
    if-ge v1, v0, :cond_6

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    instance-of v3, v3, Lcom/android/launcher3/model/data/y;

    .line 25
    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 34
    .line 35
    instance-of v4, v3, Lcom/android/launcher3/model/data/p;

    .line 36
    .line 37
    const/4 v5, 0x1

    .line 38
    if-eqz v4, :cond_4

    .line 39
    .line 40
    instance-of v4, v2, Lcom/android/launcher3/folder/FolderIcon;

    .line 41
    .line 42
    if-eqz v4, :cond_4

    .line 43
    .line 44
    instance-of v4, v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 45
    .line 46
    if-eqz v4, :cond_2

    .line 47
    .line 48
    move-object v4, v2

    .line 49
    check-cast v4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 50
    .line 51
    iget-object v4, v4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 52
    .line 53
    invoke-static {v4, p2}, Lcom/android/launcher3/Workspace;->e2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    :cond_2
    move-object v4, v3

    .line 57
    check-cast v4, Lcom/android/launcher3/model/data/p;

    .line 58
    .line 59
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    if-eqz v6, :cond_4

    .line 72
    .line 73
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 78
    .line 79
    const/4 v7, 0x0

    .line 80
    invoke-interface {p2, v6, v7}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    if-eqz v6, :cond_3

    .line 85
    .line 86
    return v5

    .line 87
    :cond_4
    invoke-interface {p2, v3, v2}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_5

    .line 92
    .line 93
    return v5

    .line 94
    :cond_5
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_6
    return p0
.end method

.method public f3()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Lcom/android/launcher3/pageindicators/d;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->computeMaxScroll()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-interface {v0, v1, p0}, Lcom/android/launcher3/pageindicators/d;->d(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public g1(I)Landroid/view/View;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/c6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/c6;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, v0}, Lcom/android/launcher3/util/Y0;->A(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public g3(I)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-interface {v0, v1, v2}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getAllShortcutAndWidgetContainersChildViewList()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/lit8 v1, v1, -0x1

    .line 13
    .line 14
    :goto_0
    if-ltz v1, :cond_1

    .line 15
    .line 16
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 17
    .line 18
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 70
    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_3

    .line 82
    .line 83
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :cond_3
    new-instance p0, Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_6

    .line 106
    .line 107
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Lcom/android/launcher3/K5;

    .line 112
    .line 113
    const/4 v2, 0x0

    .line 114
    :goto_1
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-ge v2, v3, :cond_4

    .line 119
    .line 120
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    if-eqz v3, :cond_5

    .line 125
    .line 126
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    instance-of v4, v3, Lcom/android/launcher3/widget/T;

    .line 130
    .line 131
    if-eqz v4, :cond_5

    .line 132
    .line 133
    check-cast v3, Lcom/android/launcher3/widget/T;

    .line 134
    .line 135
    invoke-virtual {v3}, Lcom/android/launcher3/widget/T;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    if-eqz v3, :cond_5

    .line 140
    .line 141
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    if-nez v4, :cond_5

    .line 146
    .line 147
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 148
    .line 149
    .line 150
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_6
    return-object p0
.end method

.method public getCellPosMapper()Lc1/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getCellPosMapper()Lc1/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getChildAt(I)Landroid/view/View;
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "getChildAt, index:"

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, ", "

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "Launcher.Workspace"

    .line 37
    .line 38
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    :cond_0
    return-object v0
.end method

.method public getCurEffect()Lcom/android/launcher3/M5;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Lx1/Z;->g(Lcom/android/launcher3/V4;)Lcom/android/launcher3/M5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getCurrentDragOverlappingLayout()Lcom/android/launcher3/CellLayout;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method protected getCurrentPageDescription()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->h(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getCurrentPageScreenIds()Lcom/android/launcher3/util/z0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    filled-new-array {p0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/android/launcher3/util/z0;->wrap([I)Lcom/android/launcher3/util/z0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getDescendantFocusability()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x60000

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0}, Landroid/view/ViewGroup;->getDescendantFocusability()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDragInfo()Lc1/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getDropView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getExpectedHeight()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsLayoutValid:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 24
    .line 25
    return p0
.end method

.method public getExpectedWidth()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsLayoutValid:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 24
    .line 25
    return p0
.end method

.method getGSAnimCallback()Lcom/android/launcher3/globalsearch/r$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->w0:Lcom/android/launcher3/globalsearch/r$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHotseat()Lcom/android/launcher3/Hotseat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHotseatDivideAnimation()Lp1/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHotseatSwapAnimation()Lp1/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->q0:Lp1/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIsDragOccuring()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/Workspace;->u0:Z

    .line 2
    .line 3
    return p0
.end method

.method public getLauncherOverlay()Lz2/a$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->o0:Lz2/a$a;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getMfvPageIndicatorMarker(I)Lcom/android/launcher3/pageindicators/b;
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v0, v0

    .line 6
    const-wide/16 v2, -0xc9

    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-le v0, v1, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/android/launcher3/pageindicators/b;->i:Lcom/android/launcher3/pageindicators/b;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->getMfvPageIndicatorMarker(I)Lcom/android/launcher3/pageindicators/b;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public getNumPagesForWallpaperParallax()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/l3;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getPageAreaRelativeToDragLayer()Landroid/graphics/Rect;
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getPanelCount()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    move v3, v1

    .line 15
    :goto_0
    add-int v4, v1, v2

    .line 16
    .line 17
    if-ge v3, v4, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, v3}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    check-cast v4, Lcom/android/launcher3/CellLayout;

    .line 24
    .line 25
    if-nez v4, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    new-instance v5, Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object v6, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    invoke-virtual {v6, v4, v5}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v5}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    :goto_1
    return-object v0
.end method

.method public getPanelCount()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/V4;->getPanelCount()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getScreenOrder()Lcom/android/launcher3/util/x0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->C0:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStateTransitionAnimation()Lcom/android/launcher3/N6;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->j0:Lcom/android/launcher3/N6;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValidateCurrentPage()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getWallpaperOffsetForCenterPage()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageNearestToCenterOfScreen()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/Workspace;->o1(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic getWorkspaceChildOnLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/M6;->getWorkspaceChildOnLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getWorkspaceTouchListener()Lcom/android/launcher3/touch/J;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->v0:Lcom/android/launcher3/touch/J;

    .line 2
    .line 3
    return-object p0
.end method

.method getmOverlayShown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/Workspace;->f0:Z

    .line 2
    .line 3
    return p0
.end method

.method public h(I)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 6
    .line 7
    const/16 v2, -0xc9

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/x0;->w(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-ltz v1, :cond_2

    .line 15
    .line 16
    if-le v0, v2, :cond_2

    .line 17
    .line 18
    if-eq p1, v1, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J1()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    add-int/lit8 v3, v1, 0x1

    .line 27
    .line 28
    if-ne p1, v3, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const p1, 0x7f1404a7

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    :goto_1
    if-nez v0, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const p1, 0x7f140201

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getPanelCount()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    div-int/2addr p1, v3

    .line 65
    add-int/2addr p1, v2

    .line 66
    div-int v2, v0, v3

    .line 67
    .line 68
    rem-int/2addr v0, v3

    .line 69
    add-int/2addr v2, v0

    .line 70
    if-lez v1, :cond_4

    .line 71
    .line 72
    add-int/lit8 v2, v2, -0x1

    .line 73
    .line 74
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const v0, 0x7f1404a8

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0
.end method

.method public h1(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public h3(Lc1/a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lc1/a;->e:Landroid/view/View;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    iget-boolean p1, p1, Lcom/android/launcher3/C2;->r0:Z

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/G4;->t()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {p1, v2}, Lcom/android/launcher3/menu/c;->A(Z)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_1

    .line 61
    .line 62
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Landroid/view/View;

    .line 67
    .line 68
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 76
    .line 77
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 78
    .line 79
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v3, ", "

    .line 83
    .line 84
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v2, "startDrag--MoreIconDrag--WorkspaceItemInfo: "

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    const-string v1, "Launcher.Workspace"

    .line 106
    .line 107
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 117
    .line 118
    invoke-virtual {p1, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_3

    .line 123
    .line 124
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p1}, Lcom/android/launcher3/menu/c;->u()V

    .line 131
    .line 132
    .line 133
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 134
    .line 135
    .line 136
    sget-object p1, Lf1/a;->x:Lf1/a$a;

    .line 137
    .line 138
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_4

    .line 143
    .line 144
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Lp1/a;->d(Landroid/view/View;)V

    .line 147
    .line 148
    .line 149
    :cond_4
    iget-boolean p1, p2, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 150
    .line 151
    if-eqz p1, :cond_5

    .line 152
    .line 153
    new-instance p1, Lcom/android/launcher3/Workspace$f;

    .line 154
    .line 155
    new-instance v1, Lcom/android/launcher3/G6;

    .line 156
    .line 157
    invoke-direct {v1}, Lcom/android/launcher3/G6;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-direct {p1, p0, p0, v1}, Lcom/android/launcher3/Workspace$f;-><init>(Lcom/android/launcher3/Workspace;Landroid/view/ViewGroup;Ljava/util/function/Function;)V

    .line 161
    .line 162
    .line 163
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->n0:Lcom/android/launcher3/dragndrop/j$b;

    .line 164
    .line 165
    :cond_5
    instance-of p1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 166
    .line 167
    if-eqz p1, :cond_6

    .line 168
    .line 169
    const p1, 0x7f0b0628

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0, p1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    instance-of v1, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 177
    .line 178
    if-eqz v1, :cond_6

    .line 179
    .line 180
    check-cast p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_6
    move-object p1, p0

    .line 184
    :goto_1
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/launcher3/Workspace;->F0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->getWorkspaceAndHotseatCellLayouts()[Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_1

    .line 8
    .line 9
    aget-object v2, p0, v1

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v3, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/4 v4, -0x1

    .line 20
    if-le v3, v4, :cond_0

    .line 21
    .line 22
    return-object v2

    .line 23
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public i3()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->c3()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->isPageInTransition()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/android/launcher3/Workspace;->G:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v0, :cond_4

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->w()Landroid/util/Pair;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_4

    .line 38
    .line 39
    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 40
    .line 41
    sget-object v4, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 42
    .line 43
    if-ne v3, v4, :cond_4

    .line 44
    .line 45
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 46
    .line 47
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 48
    .line 49
    if-ne v0, v3, :cond_4

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 52
    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    iget v0, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 56
    .line 57
    if-lez v0, :cond_4

    .line 58
    .line 59
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v3, "stripEmptyScreens isCurShowingAIFutureWidget getAnimingFromToState return, mTempAiFutureScreenId="

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget v3, p0, Lcom/android/launcher3/Workspace;->F0:I

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v3, " mTempRemoveAiFutureScreen="

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->E0:Lcom/android/launcher3/CellLayout;

    .line 80
    .line 81
    if-eqz p0, :cond_3

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    move v1, v2

    .line 85
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string v0, "Launcher.Workspace"

    .line 93
    .line 94
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    new-instance v3, Lcom/android/launcher3/util/x0;

    .line 103
    .line 104
    invoke-direct {v3}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 105
    .line 106
    .line 107
    iget-object v4, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 108
    .line 109
    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    move v5, v2

    .line 114
    :goto_1
    if-ge v5, v4, :cond_6

    .line 115
    .line 116
    iget-object v6, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 117
    .line 118
    invoke-virtual {v6, v5}, Landroid/util/SparseArray;->keyAt(I)I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    iget-object v7, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 123
    .line 124
    invoke-virtual {v7, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v7

    .line 128
    check-cast v7, Lcom/android/launcher3/CellLayout;

    .line 129
    .line 130
    invoke-virtual {v7}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 131
    .line 132
    .line 133
    move-result-object v7

    .line 134
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    .line 135
    .line 136
    .line 137
    move-result v7

    .line 138
    if-nez v7, :cond_5

    .line 139
    .line 140
    invoke-virtual {v3, v6}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 141
    .line 142
    .line 143
    :cond_5
    add-int/lit8 v5, v5, 0x1

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_6
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J1()Z

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    if-eqz v4, :cond_8

    .line 151
    .line 152
    invoke-virtual {v3}, Lcom/android/launcher3/util/x0;->iterator()Ljava/util/Iterator;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    :cond_7
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    if-eqz v5, :cond_8

    .line 161
    .line 162
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    check-cast v5, Ljava/lang/Integer;

    .line 167
    .line 168
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    invoke-virtual {p0, v5}, Lcom/android/launcher3/Workspace;->k1(I)I

    .line 173
    .line 174
    .line 175
    move-result v5

    .line 176
    invoke-virtual {v3, v5}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-nez v5, :cond_7

    .line 181
    .line 182
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 183
    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-virtual {v3}, Lcom/android/launcher3/util/x0;->isEmpty()Z

    .line 191
    .line 192
    .line 193
    move-result v5

    .line 194
    if-nez v5, :cond_9

    .line 195
    .line 196
    if-eqz v4, :cond_9

    .line 197
    .line 198
    invoke-virtual {v4}, Landroid/animation/LayoutTransition;->isRunning()Z

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    if-eqz v5, :cond_9

    .line 203
    .line 204
    new-instance v5, Lcom/android/launcher3/Workspace$d;

    .line 205
    .line 206
    invoke-direct {v5, p0}, Lcom/android/launcher3/Workspace$d;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v4, v5}, Landroid/animation/LayoutTransition;->addTransitionListener(Landroid/animation/LayoutTransition$TransitionListener;)V

    .line 210
    .line 211
    .line 212
    :cond_9
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getPanelCount()I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    move v5, v2

    .line 217
    :goto_3
    invoke-virtual {v3}, Lcom/android/launcher3/util/x0;->size()I

    .line 218
    .line 219
    .line 220
    move-result v6

    .line 221
    if-ge v2, v6, :cond_d

    .line 222
    .line 223
    invoke-virtual {v3, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 224
    .line 225
    .line 226
    move-result v6

    .line 227
    iget-object v7, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 228
    .line 229
    invoke-virtual {v7, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v7

    .line 233
    check-cast v7, Lcom/android/launcher3/CellLayout;

    .line 234
    .line 235
    iget-object v8, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 236
    .line 237
    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->remove(I)V

    .line 238
    .line 239
    .line 240
    iget-object v8, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 241
    .line 242
    invoke-virtual {v8, v6}, Lcom/android/launcher3/util/x0;->z(I)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 246
    .line 247
    .line 248
    move-result v8

    .line 249
    if-le v8, v4, :cond_b

    .line 250
    .line 251
    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 252
    .line 253
    .line 254
    move-result v6

    .line 255
    if-ge v6, v0, :cond_a

    .line 256
    .line 257
    add-int/lit8 v5, v5, 0x1

    .line 258
    .line 259
    :cond_a
    invoke-virtual {p0, v7}, Lcom/android/launcher3/V4;->removeView(Landroid/view/View;)V

    .line 260
    .line 261
    .line 262
    goto :goto_5

    .line 263
    :cond_b
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J1()Z

    .line 264
    .line 265
    .line 266
    move-result v8

    .line 267
    if-eqz v8, :cond_c

    .line 268
    .line 269
    rem-int/lit8 v6, v6, 0x2

    .line 270
    .line 271
    if-ne v6, v1, :cond_c

    .line 272
    .line 273
    const/16 v6, -0xc8

    .line 274
    .line 275
    goto :goto_4

    .line 276
    :cond_c
    const/16 v6, -0xc9

    .line 277
    .line 278
    :goto_4
    iget-object v8, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 279
    .line 280
    invoke-virtual {v8, v6, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 281
    .line 282
    .line 283
    iget-object v7, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 284
    .line 285
    invoke-virtual {v7, v6}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 286
    .line 287
    .line 288
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 289
    .line 290
    goto :goto_3

    .line 291
    :cond_d
    if-ltz v5, :cond_e

    .line 292
    .line 293
    sub-int/2addr v0, v5

    .line 294
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 295
    .line 296
    .line 297
    :cond_e
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->p3()V

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 301
    .line 302
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-virtual {v0, p0}, Lx1/Z;->b(Lcom/android/launcher3/Workspace;)V

    .line 307
    .line 308
    .line 309
    return-void
.end method

.method protected ifTriggerFlingDrag(ILandroid/view/MotionEvent;F)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mOrientationHandler:Lcom/android/launcher3/touch/G;

    .line 2
    .line 3
    invoke-interface {v0, p2, p1}, Lcom/android/launcher3/touch/G;->getSecondaryDirection(Landroid/view/MotionEvent;I)F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget p2, p0, Lcom/android/launcher3/V4;->mDownMotionSecondary:F

    .line 8
    .line 9
    sub-float/2addr p1, p2

    .line 10
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    cmpl-float p1, p2, p1

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    const/4 p3, 0x1

    .line 22
    if-lez p1, :cond_0

    .line 23
    .line 24
    move p1, p3

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move p1, p2

    .line 27
    :goto_0
    iget-boolean p0, p0, Lcom/android/launcher3/V4;->mDownWithBeingDragged:Z

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    return p2

    .line 35
    :cond_2
    :goto_1
    return p3
.end method

.method protected initEdgeEffect()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/V4;->initEdgeEffect()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ly1/g;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, v1}, Ly1/g;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 24
    .line 25
    new-instance v0, Ly1/g;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {v0, v1}, Ly1/g;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public isClipCanvasWidth()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected isSignificantMove(FI)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->isSignificantMove(FI)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    iget p0, v0, Lcom/android/launcher3/h0;->V0:I

    .line 17
    .line 18
    int-to-float p0, p0

    .line 19
    const p2, 0x3e19999a    # 0.15f

    .line 20
    .line 21
    .line 22
    mul-float/2addr p0, p2

    .line 23
    cmpl-float p0, p1, p0

    .line 24
    .line 25
    if-lez p0, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public j1(I)I
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ge p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, -0x1

    .line 19
    return p0
.end method

.method public k(Lcom/android/launcher3/CellLayout;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public k1(I)I
    .locals 1

    .line 1
    const/16 p0, -0xc8

    .line 2
    .line 3
    const/16 v0, -0xc9

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    if-ne p1, p0, :cond_1

    .line 9
    .line 10
    return v0

    .line 11
    :cond_1
    rem-int/lit8 p0, p1, 0x2

    .line 12
    .line 13
    if-nez p0, :cond_2

    .line 14
    .line 15
    add-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    return p1

    .line 18
    :cond_2
    add-int/lit8 p1, p1, -0x1

    .line 19
    .line 20
    return p1
.end method

.method public k2(Lcom/android/launcher3/util/Y0$a;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->getWorkspaceAndHotseatCellLayouts()[Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {p0, v3, p1}, Lcom/android/launcher3/Workspace;->f2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    :goto_1
    return-void
.end method

.method public k3()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->j3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Lcom/android/launcher3/n0$a;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->P:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iput-boolean v0, v1, Lcom/android/launcher3/Hotseat;->K0:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->Q:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->w:Lcom/android/launcher3/CellLayout;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->C:[F

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Lcom/android/launcher3/n0$a;->a([F)[F

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Lcom/android/launcher3/Workspace;->C:[F

    .line 22
    .line 23
    aget v0, v1, v0

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    aget v1, v1, v2

    .line 27
    .line 28
    invoke-direct {p0, p1, v0, v1, v2}, Lcom/android/launcher3/Workspace;->U2(Lcom/android/launcher3/n0$a;FFZ)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public l1(Lcom/android/launcher3/CellLayout;)Lcom/android/launcher3/CellLayout;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, -0x1

    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->k1(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method protected l2()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/I6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/I6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/Workspace;->j2(Lcom/android/launcher3/util/Y0$a;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected m2()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/J6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/J6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/Workspace;->i2(Lcom/android/launcher3/util/Y0$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public m3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/l3;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->K:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->requestLayout()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public n(I)Lcom/android/launcher3/CellLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    return-object p0
.end method

.method public n1(Ljava/lang/Object;)Landroid/view/View;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/k6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/k6;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, v0}, Lcom/android/launcher3/util/Y0;->A(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public n3()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/V3;

    .line 12
    .line 13
    sget v1, Lcom/android/launcher3/V3;->f:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V3;->hasFlag(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, v1

    .line 25
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->D1()LO0/r;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, LO0/c;->f()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-nez v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    :goto_1
    if-ge v1, v2, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lcom/android/launcher3/CellLayout;

    .line 48
    .line 49
    invoke-direct {p0, v0, v3}, Lcom/android/launcher3/Workspace;->o3(ILcom/android/launcher3/CellLayout;)V

    .line 50
    .line 51
    .line 52
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method protected notifyPageSwitchListener(I)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->notifyPageSwitchListener(I)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 5
    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    if-ge p1, v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->g0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->f0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 14
    .line 15
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-interface {v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withSrcState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withDstState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v3, p1}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;->setPageIndex(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v2, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setWorkspace(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 55
    .line 56
    invoke-interface {v1, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 64
    .line 65
    iget p0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 66
    .line 67
    invoke-static {p1, p0}, Lx1/c0;->i(Lcom/android/launcher3/C2;I)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method o2(Landroid/view/View;[F)V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    aget v0, p2, p0

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    int-to-float v1, v1

    .line 9
    sub-float/2addr v0, v1

    .line 10
    aput v0, p2, p0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    aget v0, p2, p0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-float p1, p1

    .line 20
    sub-float/2addr v0, p1

    .line 21
    aput v0, p2, p0

    .line 22
    .line 23
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/l3;->m(Landroid/os/IBinder;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->computeScroll()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->m0:Lcom/android/launcher3/statemanager/d$g;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/l3;->m(Landroid/os/IBinder;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->m0:Lcom/android/launcher3/statemanager/d$g;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method protected onDisallowSwipeToMinusOnePage()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->o2()Lz2/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lz2/a;->n()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/H4;->c(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/android/launcher3/Workspace;->R:F

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/android/launcher3/Workspace;->S:F

    .line 26
    .line 27
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->w2(Landroid/view/MotionEvent;)V

    .line 28
    .line 29
    .line 30
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->H:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->K:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/l3;->k(Z)V

    .line 12
    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/android/launcher3/Workspace;->K:Z

    .line 15
    .line 16
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFirstLayout:Z

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 21
    .line 22
    if-ltz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-ge v0, v1, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/util/l3;->l()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/util/l3;->n()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->J:Lcom/android/launcher3/util/l3;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/util/l3;->g()V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_0
    invoke-super/range {p0 .. p5}, Lcom/android/launcher3/V4;->onLayout(ZIIII)V

    .line 57
    .line 58
    .line 59
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->w3()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method protected onPageBeginTransition()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0x8

    .line 5
    .line 6
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 7
    .line 8
    .line 9
    invoke-super {p0}, Lcom/android/launcher3/V4;->onPageBeginTransition()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->r3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected onPageEndTransition()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/V4;->onPageEndTransition()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->r3()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I3()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->v()V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->G:Z

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->i3()V

    .line 42
    .line 43
    .line 44
    iput-boolean v1, p0, Lcom/android/launcher3/Workspace;->G:Z

    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->U3()V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v2, "onPageEndTransition:WORK current page: "

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v2, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, ", next page: "

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget v2, p0, Lcom/android/launcher3/V4;->mNextPage:I

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v2, ", scroller position: "

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 82
    .line 83
    if-eqz v2, :cond_2

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/widget/OverScroller;->getCurrX()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const-string v1, "Launcher.Workspace"

    .line 97
    .line 98
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    if-eqz v0, :cond_3

    .line 108
    .line 109
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0, p0}, Lx1/Z;->q(Lcom/android/launcher3/Workspace;)V

    .line 116
    .line 117
    .line 118
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->w0:Lcom/android/launcher3/globalsearch/r$b;

    .line 119
    .line 120
    if-eqz p0, :cond_4

    .line 121
    .line 122
    invoke-interface {p0}, Lcom/android/launcher3/globalsearch/r$b;->b()V

    .line 123
    .line 124
    .line 125
    :cond_4
    return-void
.end method

.method protected onScrollChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/T6;->onScrollChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/android/launcher3/Workspace;->E:Z

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2}, Lcom/android/launcher3/statemanager/d;->x()Lcom/android/launcher3/statemanager/a;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    sget-object p4, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 19
    .line 20
    if-eq p2, p4, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Landroid/animation/LayoutTransition;->isRunning()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->f3()V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->w3()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->x3()V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->X0()V

    .line 50
    .line 51
    .line 52
    const/4 p2, 0x0

    .line 53
    invoke-static {p0, p1, p3, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->c0(Lcom/android/launcher3/Workspace;IIZ)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method protected onSetAlpha(I)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/blur/f;->j(Lcom/android/launcher3/C2;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onSetAlpha(I)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Workspace;->c3(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/H4;->c(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_14

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-static {v0, v3, v2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    and-int/lit16 v0, v0, 0xff

    .line 29
    .line 30
    const/4 v2, 0x6

    .line 31
    if-eq v0, v2, :cond_1

    .line 32
    .line 33
    goto/16 :goto_a

    .line 34
    .line 35
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 36
    .line 37
    if-eqz v0, :cond_13

    .line 38
    .line 39
    iget v0, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getOrientationHandler()Lcom/android/launcher3/touch/G;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-interface {v2, p1, v0}, Lcom/android/launcher3/touch/G;->getPrimaryDirection(Landroid/view/MotionEvent;I)F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-object v2, p0, Lcom/android/launcher3/V4;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 54
    .line 55
    if-nez v2, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->snapToDestination()V

    .line 58
    .line 59
    .line 60
    const-string v0, "Launcher.Workspace"

    .line 61
    .line 62
    const-string v1, "onTouchEvent--velocityTracker == null"

    .line 63
    .line 64
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    goto/16 :goto_a

    .line 68
    .line 69
    :cond_2
    iget v4, p0, Lcom/android/launcher3/V4;->mMaximumVelocity:I

    .line 70
    .line 71
    int-to-float v4, v4

    .line 72
    const/16 v5, 0x3e8

    .line 73
    .line 74
    invoke-virtual {v2, v5, v4}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getOrientationHandler()Lcom/android/launcher3/touch/G;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    iget v5, p0, Lcom/android/launcher3/V4;->mActivePointerId:I

    .line 82
    .line 83
    invoke-interface {v4, v2, v5}, Lcom/android/launcher3/touch/G;->getPrimaryVelocity(Landroid/view/VelocityTracker;I)F

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    float-to-int v2, v2

    .line 88
    iget v4, p0, Lcom/android/launcher3/V4;->mDownMotionPrimary:F

    .line 89
    .line 90
    sub-float v4, v0, v4

    .line 91
    .line 92
    float-to-int v4, v4

    .line 93
    iget v5, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 94
    .line 95
    invoke-virtual {p0, v5}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    int-to-float v6, v6

    .line 108
    int-to-float v5, v5

    .line 109
    iget v7, p0, Lcom/android/launcher3/V4;->SIGNIFICANT_MOVE_THRESHOLD_LOCAL:F

    .line 110
    .line 111
    mul-float/2addr v7, v5

    .line 112
    cmpl-float v6, v6, v7

    .line 113
    .line 114
    if-lez v6, :cond_3

    .line 115
    .line 116
    move v6, v3

    .line 117
    goto :goto_0

    .line 118
    :cond_3
    move v6, v1

    .line 119
    :goto_0
    iget v7, p0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 120
    .line 121
    iget v8, p0, Lcom/android/launcher3/V4;->mLastMotion:F

    .line 122
    .line 123
    sub-float/2addr v8, v0

    .line 124
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    add-float/2addr v7, v0

    .line 129
    iput v7, p0, Lcom/android/launcher3/V4;->mTotalMotion:F

    .line 130
    .line 131
    iget v0, p0, Lcom/android/launcher3/V4;->mTouchSlop:I

    .line 132
    .line 133
    int-to-float v0, v0

    .line 134
    cmpl-float v0, v7, v0

    .line 135
    .line 136
    if-lez v0, :cond_4

    .line 137
    .line 138
    invoke-virtual {p0, v2}, Lcom/android/launcher3/Workspace;->shouldFlingForVelocity(I)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_4

    .line 143
    .line 144
    move v0, v3

    .line 145
    goto :goto_1

    .line 146
    :cond_4
    move v0, v1

    .line 147
    :goto_1
    iget-boolean v7, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 148
    .line 149
    if-eqz v7, :cond_6

    .line 150
    .line 151
    if-lez v4, :cond_5

    .line 152
    .line 153
    :goto_2
    move v8, v3

    .line 154
    goto :goto_3

    .line 155
    :cond_5
    move v8, v1

    .line 156
    goto :goto_3

    .line 157
    :cond_6
    if-gez v4, :cond_5

    .line 158
    .line 159
    goto :goto_2

    .line 160
    :goto_3
    if-eqz v7, :cond_8

    .line 161
    .line 162
    if-lez v2, :cond_7

    .line 163
    .line 164
    :goto_4
    move v7, v3

    .line 165
    goto :goto_5

    .line 166
    :cond_7
    move v7, v1

    .line 167
    goto :goto_5

    .line 168
    :cond_8
    if-gez v2, :cond_7

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :goto_5
    iget-boolean v9, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 172
    .line 173
    if-nez v9, :cond_12

    .line 174
    .line 175
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 176
    .line 177
    .line 178
    move-result v9

    .line 179
    int-to-float v9, v9

    .line 180
    const v10, 0x3ea8f5c3    # 0.33f

    .line 181
    .line 182
    .line 183
    mul-float/2addr v5, v10

    .line 184
    cmpl-float v5, v9, v5

    .line 185
    .line 186
    if-lez v5, :cond_9

    .line 187
    .line 188
    int-to-float v5, v2

    .line 189
    invoke-static {v5}, Ljava/lang/Math;->signum(F)F

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    int-to-float v4, v4

    .line 194
    invoke-static {v4}, Ljava/lang/Math;->signum(F)F

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    cmpl-float v4, v5, v4

    .line 199
    .line 200
    if-eqz v4, :cond_9

    .line 201
    .line 202
    if-eqz v0, :cond_9

    .line 203
    .line 204
    move v4, v3

    .line 205
    goto :goto_6

    .line 206
    :cond_9
    move v4, v1

    .line 207
    :goto_6
    if-eqz v6, :cond_a

    .line 208
    .line 209
    if-nez v8, :cond_a

    .line 210
    .line 211
    if-eqz v0, :cond_b

    .line 212
    .line 213
    :cond_a
    if-eqz v0, :cond_d

    .line 214
    .line 215
    if-nez v7, :cond_d

    .line 216
    .line 217
    :cond_b
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V4;->isValidPageForScroll(Z)Z

    .line 218
    .line 219
    .line 220
    move-result v5

    .line 221
    if-eqz v5, :cond_d

    .line 222
    .line 223
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 224
    .line 225
    if-eqz v4, :cond_c

    .line 226
    .line 227
    goto :goto_7

    .line 228
    :cond_c
    sub-int/2addr v0, v3

    .line 229
    :goto_7
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/T6;->snapToPageWithVelocity(II)Z

    .line 230
    .line 231
    .line 232
    goto :goto_9

    .line 233
    :cond_d
    if-eqz v6, :cond_e

    .line 234
    .line 235
    if-eqz v8, :cond_e

    .line 236
    .line 237
    if-eqz v0, :cond_f

    .line 238
    .line 239
    :cond_e
    if-eqz v0, :cond_11

    .line 240
    .line 241
    if-eqz v7, :cond_11

    .line 242
    .line 243
    :cond_f
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 244
    .line 245
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 246
    .line 247
    .line 248
    move-result v5

    .line 249
    sub-int/2addr v5, v3

    .line 250
    if-ge v0, v5, :cond_11

    .line 251
    .line 252
    iget v0, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 253
    .line 254
    if-eqz v4, :cond_10

    .line 255
    .line 256
    goto :goto_8

    .line 257
    :cond_10
    add-int/2addr v0, v3

    .line 258
    :goto_8
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/T6;->snapToPageWithVelocity(II)Z

    .line 259
    .line 260
    .line 261
    goto :goto_9

    .line 262
    :cond_11
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->snapToDestination()V

    .line 263
    .line 264
    .line 265
    :cond_12
    :goto_9
    invoke-static {}, Lx1/O;->Q1()Z

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    if-nez v0, :cond_13

    .line 270
    .line 271
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 272
    .line 273
    :cond_13
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mIsInterruptScrollAnimation:Z

    .line 274
    .line 275
    :cond_14
    :goto_a
    invoke-super {p0, p1}, Lcom/android/launcher3/T6;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 276
    .line 277
    .line 278
    move-result p0

    .line 279
    return p0
.end method

.method protected onUnhandledTap(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->v0:Lcom/android/launcher3/touch/J;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/android/launcher3/touch/J;->onClick(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/android/launcher3/CellLayout;->setOnInterceptTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 13
    .line 14
    .line 15
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onViewAdded(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v0, 0x1

    .line 23
    if-le p1, v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setIsCircle(Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setIsCircle(Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 35
    .line 36
    const-string p1, "A Workspace can only have CellLayout children."

    .line 37
    .line 38
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw p0
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 v0, 0x1

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setIsCircle(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public p(Lcom/android/launcher3/n0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/j;->h(Lcom/android/launcher3/n0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p1(I)Lcom/android/launcher3/widget/T;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/j6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/j6;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/widget/T;

    .line 11
    .line 12
    return-object p0
.end method

.method protected p3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->C1()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getCurrentPageDescription()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, LJ/I;->C0(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method q2(Lcom/android/launcher3/Hotseat;[F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->A:[F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v2, p2, v1

    .line 5
    .line 6
    float-to-int v2, v2

    .line 7
    int-to-float v2, v2

    .line 8
    aput v2, v0, v1

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    aget v3, p2, v2

    .line 12
    .line 13
    float-to-int v3, v3

    .line 14
    int-to-float v3, v3

    .line 15
    aput v3, v0, v2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->A:[F

    .line 24
    .line 25
    invoke-virtual {v0, p0, v3, v2}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[FZ)F

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->A:[F

    .line 35
    .line 36
    invoke-virtual {v0, p1, v3}, Lcom/android/launcher3/views/BaseDragLayer;->mapCoordInSelfToDescendant(Landroid/view/View;[F)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->A:[F

    .line 40
    .line 41
    aget p1, p0, v1

    .line 42
    .line 43
    aput p1, p2, v1

    .line 44
    .line 45
    aget p0, p0, v2

    .line 46
    .line 47
    aput p0, p2, v2

    .line 48
    .line 49
    return-void
.end method

.method public r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->t()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    const-string v0, "onDropCompleted"

    .line 16
    .line 17
    const-string v1, "Launcher.Workspace"

    .line 18
    .line 19
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    if-eqz p3, :cond_1

    .line 23
    .line 24
    if-eq p1, p0, :cond_3

    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 27
    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    iget-object p1, p1, Lc1/a;->e:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->K2(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 37
    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    iget-object p1, p1, Lc1/a;->e:Landroid/view/View;

    .line 41
    .line 42
    instance-of p1, p1, Lcom/android/launcher3/widget/T;

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    iget-object p1, p2, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 47
    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    invoke-virtual {p1, v0}, Lcom/android/launcher3/dragndrop/v;->r(Z)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 57
    .line 58
    iget v2, v0, Lc1/a;->g:I

    .line 59
    .line 60
    iget v0, v0, Lc1/a;->f:I

    .line 61
    .line 62
    invoke-virtual {p1, v2, v0}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 69
    .line 70
    iget-object v0, v0, Lc1/a;->e:Landroid/view/View;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Lcom/android/launcher3/CellLayout;->l0(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    :goto_0
    iget-object p1, p2, Lcom/android/launcher3/n0$a;->h:Lcom/android/launcher3/model/data/y;

    .line 76
    .line 77
    iget p1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 78
    .line 79
    invoke-interface {p0, p1}, Lcom/android/launcher3/util/Y0;->x(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-boolean v0, p2, Lcom/android/launcher3/n0$a;->j:Z

    .line 84
    .line 85
    const/4 v2, 0x0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    if-eqz p1, :cond_4

    .line 89
    .line 90
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 91
    .line 92
    .line 93
    :cond_4
    const/4 p1, 0x0

    .line 94
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 95
    .line 96
    invoke-virtual {p0, p2}, Lcom/android/launcher3/Workspace;->O2(Lcom/android/launcher3/n0$a;)V

    .line 97
    .line 98
    .line 99
    if-nez p3, :cond_5

    .line 100
    .line 101
    iget-boolean p1, p0, Lcom/android/launcher3/Workspace;->P:Z

    .line 102
    .line 103
    if-eqz p1, :cond_5

    .line 104
    .line 105
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-boolean p1, p1, Lcom/android/launcher3/X3;->B0:Z

    .line 112
    .line 113
    if-eqz p1, :cond_5

    .line 114
    .line 115
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 116
    .line 117
    if-eqz p1, :cond_5

    .line 118
    .line 119
    iput-boolean v2, p0, Lcom/android/launcher3/Workspace;->P:Z

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getHotseat()Lcom/android/launcher3/Hotseat;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-boolean v2, p1, Lcom/android/launcher3/Hotseat;->K0:Z

    .line 126
    .line 127
    const-string p1, "onDropCompleted: reset folder create bg."

    .line 128
    .line 129
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->M:Lcom/android/launcher3/folder/u0;

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/android/launcher3/folder/u0;->a0()V

    .line 135
    .line 136
    .line 137
    :cond_5
    :goto_1
    return-void
.end method

.method public r1()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    const/16 v1, -0xc9

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getPanelCount()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-le v0, v1, :cond_1

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J1()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 28
    .line 29
    const/16 v0, -0xc8

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    :cond_0
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public r2()V
    .locals 2

    .line 1
    const-string v0, "Launcher.Workspace"

    .line 2
    .line 3
    const-string v1, "moveToDefaultScreen: "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->s2(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public s1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    instance-of p0, p0, Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    return p0
.end method

.method public s2(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lx1/Z;->d()Landroid/util/Pair;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x1

    .line 24
    if-eq v1, v2, :cond_3

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsSnapToHome:Z

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->r1()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x2

    .line 42
    if-ne v1, v2, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Lx1/Z;->l()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1, p0}, Lx1/Z;->x(Lcom/android/launcher3/Workspace;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/Workspace;->t2(IZ)V

    .line 68
    .line 69
    .line 70
    :cond_3
    :goto_0
    return-void
.end method

.method public s3(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/u6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/u6;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public scrollLeft()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->E:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0}, Lcom/android/launcher3/V4;->scrollLeft()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->V0()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return v0
.end method

.method public scrollRight()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->E:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->J3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0}, Lcom/android/launcher3/V4;->scrollRight()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->V0()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return v0
.end method

.method setCurrentDragOverlappingLayout(Lcom/android/launcher3/CellLayout;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->v:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/CellLayout;->setIsDragOverlapping(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->v:Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    invoke-virtual {p1, p0}, Lcom/android/launcher3/CellLayout;->setIsDragOverlapping(Z)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method setCurrentDropLayout(Lcom/android/launcher3/CellLayout;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->x0()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->k0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->j0()V

    .line 18
    .line 19
    .line 20
    :cond_1
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->K0(Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->J0()V

    .line 25
    .line 26
    .line 27
    const/4 p1, -0x1

    .line 28
    invoke-virtual {p0, p1, p1}, Lcom/android/launcher3/Workspace;->T2(II)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method setDragMode(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/Workspace;->V:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_4

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I0()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->K0(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->J0()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x2

    .line 19
    const/4 v1, 0x1

    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->K0(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->J0()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    if-ne p1, v1, :cond_2

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I0()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->K0(Z)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const/4 v0, 0x3

    .line 39
    if-ne p1, v0, :cond_3

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I0()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->J0()V

    .line 45
    .line 46
    .line 47
    :cond_3
    :goto_0
    iput p1, p0, Lcom/android/launcher3/Workspace;->V:I

    .line 48
    .line 49
    :cond_4
    return-void
.end method

.method public setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->w0:Lcom/android/launcher3/globalsearch/r$b;

    .line 2
    .line 3
    return-void
.end method

.method public setIconArrangeCurrentPage(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, p1}, Lcom/android/launcher3/menu/c;->y(I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/C2;->q:Lcom/android/launcher3/DropTargetBar;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/android/launcher3/DropTargetBar;->g(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setInsets: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Launcher.Workspace"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->d1()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput-boolean v1, p0, Lcom/android/launcher3/Workspace;->I:Z

    .line 34
    .line 35
    iget-object v1, v0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 36
    .line 37
    invoke-static {}, Lx1/O;->k1()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 44
    .line 45
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    const v5, 0x7f070c41

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    sub-int/2addr v3, v4

    .line 59
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 60
    .line 61
    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    invoke-virtual {p0, v2, v3, v4, v5}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 68
    .line 69
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 70
    .line 71
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 72
    .line 73
    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    .line 74
    .line 75
    invoke-virtual {p0, v2, v3, v4, v5}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/V4;->mInsets:Landroid/graphics/Rect;

    .line 79
    .line 80
    invoke-virtual {v2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 81
    .line 82
    .line 83
    iget-boolean v2, p0, Lcom/android/launcher3/Workspace;->I:Z

    .line 84
    .line 85
    if-eqz v2, :cond_1

    .line 86
    .line 87
    iget p1, v0, Lcom/android/launcher3/h0;->r1:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setPageSpacing(I)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_1
    iget v2, p1, Landroid/graphics/Rect;->left:I

    .line 94
    .line 95
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 96
    .line 97
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iget v0, v0, Lcom/android/launcher3/h0;->r1:I

    .line 102
    .line 103
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 104
    .line 105
    add-int/lit8 v1, v1, 0x1

    .line 106
    .line 107
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setPageSpacing(I)V

    .line 116
    .line 117
    .line 118
    :goto_1
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->q3()V

    .line 119
    .line 120
    .line 121
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->A3()V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 125
    .line 126
    if-eqz p1, :cond_2

    .line 127
    .line 128
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->W2()V

    .line 129
    .line 130
    .line 131
    :cond_2
    return-void
.end method

.method public setIsDragOccuring(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/Workspace;->u0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLauncherOverlay(Lz2/a$c;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lz2/a$a;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->o0:Lz2/a$a;

    .line 5
    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    new-instance p1, Ly1/g;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {p1, v0}, Ly1/g;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance p1, Lcom/android/launcher3/util/i0;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-direct {p1, v0}, Lcom/android/launcher3/util/i0;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->y0:Ly1/e;

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    new-instance v0, Ly1/e;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->o0:Lz2/a$a;

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-direct {v0, v1, v2, v3}, Ly1/e;-><init>(Lcom/android/launcher3/C2;Lz2/a$a;Z)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->y0:Ly1/e;

    .line 52
    .line 53
    invoke-interface {p1, p0}, Lz2/a$c;->e(Lz2/a$b;)V

    .line 54
    .line 55
    .line 56
    move-object p1, v0

    .line 57
    :goto_1
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iput-object p1, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_2
    iput-object p1, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 65
    .line 66
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->t1()V

    .line 67
    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->a(F)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public setPivotToScaleWithSelf(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPivotY()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    add-float/2addr v0, v1

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v1, v1

    .line 16
    sub-float/2addr v0, v1

    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-float/2addr v0, v1

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotY(F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPivotX()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLeft()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    int-to-float p0, p0

    .line 34
    add-float/2addr v0, p0

    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    int-to-float p0, p0

    .line 40
    sub-float/2addr v0, p0

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    sub-float/2addr v0, p0

    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotX(F)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public setResetIconVisiblityIgnore(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->z0:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public setScaleX(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->n(Lcom/android/launcher3/C2;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setState(Lcom/android/launcher3/V3;)V
    .locals 2

    .line 2
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->y2()V

    .line 3
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    move-result-object v0

    check-cast v0, Lcom/android/launcher3/V3;

    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/V3;->H(Lcom/android/launcher3/C2;Lcom/android/launcher3/V3;)V

    .line 4
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->j0:Lcom/android/launcher3/N6;

    invoke-virtual {v0, p1}, Lcom/android/launcher3/N6;->i(Lcom/android/launcher3/V3;)V

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->v2()V

    return-void
.end method

.method public bridge synthetic setState(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->setState(Lcom/android/launcher3/V3;)V

    return-void
.end method

.method public bridge synthetic setStateWithAnimation(Ljava/lang/Object;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/Workspace;->X2(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method setup(Lcom/android/launcher3/dragndrop/j;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/dragndrop/O;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/dragndrop/O;-><init>(Lcom/android/launcher3/C2;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->D:Lcom/android/launcher3/dragndrop/O;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->r3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected shouldFlingForVelocity(I)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/Workspace;->g0:F

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->shouldFlingForVelocity(I)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method protected snapToDestination()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->y0:Ly1/e;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Ly1/e;->isFinished()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->G1()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->H1()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void

    .line 41
    :cond_2
    invoke-super {p0}, Lcom/android/launcher3/V4;->snapToDestination()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public t1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->t:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o0:Lz2/a$a;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Lz2/a$a;->f()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    new-instance v0, Ly1/e;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->o0:Lz2/a$a;

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    invoke-direct {v0, v1, v2, v3}, Ly1/e;-><init>(Lcom/android/launcher3/C2;Lz2/a$a;Z)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v0, 0x0

    .line 37
    :goto_0
    if-nez v0, :cond_2

    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    new-instance v0, Ly1/g;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-direct {v0, v1}, Ly1/g;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    new-instance v0, Lcom/android/launcher3/util/i0;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/i0;-><init>(Landroid/content/Context;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    :goto_1
    iget-boolean v1, p0, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 69
    .line 70
    if-nez v1, :cond_3

    .line 71
    .line 72
    iput-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 73
    .line 74
    :cond_3
    return-void
.end method

.method public t2(IZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->I3()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    :cond_1
    if-eqz p2, :cond_3

    .line 25
    .line 26
    iget-object p2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    sget-object v0, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 33
    .line 34
    invoke-virtual {p2, v0}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    const/16 p2, 0x2ee

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget p2, p0, Lcom/android/launcher3/V4;->mPageSnapAnimationDuration:I

    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/V4;->snapToCrossScreen(II)Z

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 50
    .line 51
    .line 52
    :cond_4
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    if-eqz p0, :cond_5

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 59
    .line 60
    .line 61
    :cond_5
    :goto_2
    return-void
.end method

.method public t3(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/s6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/s6;-><init>(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/Folder;->w1(Lcom/android/launcher3/util/Y0$a;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method protected u1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->Z2()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->Y2()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public u3(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/c;->E(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-super {p0, p1}, Lcom/android/launcher3/T6;->updateIsBeingDraggedOnTouchDown(Landroid/view/MotionEvent;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iput v1, p0, Lcom/android/launcher3/Workspace;->R:F

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lcom/android/launcher3/Workspace;->S:F

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->T:Landroid/view/View;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget v3, p0, Lcom/android/launcher3/Workspace;->R:F

    .line 23
    .line 24
    const/4 v4, 0x2

    .line 25
    new-array v4, v4, [F

    .line 26
    .line 27
    aput v3, v4, v2

    .line 28
    .line 29
    aput p1, v4, v0

    .line 30
    .line 31
    invoke-static {v1, p0, v4}, Lcom/android/launcher3/N5;->K(Landroid/view/View;Landroid/view/View;[F)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->T:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    int-to-float p1, p1

    .line 41
    aget v1, v4, v2

    .line 42
    .line 43
    cmpg-float p1, p1, v1

    .line 44
    .line 45
    if-gtz p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->T:Landroid/view/View;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    int-to-float p1, p1

    .line 54
    aget v1, v4, v2

    .line 55
    .line 56
    cmpl-float p1, p1, v1

    .line 57
    .line 58
    if-ltz p1, :cond_0

    .line 59
    .line 60
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->T:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    int-to-float p1, p1

    .line 67
    aget v1, v4, v0

    .line 68
    .line 69
    cmpg-float p1, p1, v1

    .line 70
    .line 71
    if-gtz p1, :cond_0

    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->T:Landroid/view/View;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    int-to-float p1, p1

    .line 80
    aget v1, v4, v0

    .line 81
    .line 82
    cmpl-float p1, p1, v1

    .line 83
    .line 84
    if-ltz p1, :cond_0

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    move v0, v2

    .line 88
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->U:Z

    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    iput-boolean v2, p0, Lcom/android/launcher3/Workspace;->U:Z

    .line 92
    .line 93
    return-void
.end method

.method public v()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->w:Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/16 v0, -0x65

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 v0, -0x64

    .line 19
    .line 20
    :goto_0
    int-to-long v0, v0

    .line 21
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 22
    .line 23
    iget-object v2, v2, Lc1/a;->e:Landroid/view/View;

    .line 24
    .line 25
    invoke-direct {p0, v0, v1, v2}, Lcom/android/launcher3/Workspace;->a3(JLandroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, 0x0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowLeft:Lcom/android/launcher3/util/i0;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/V4;->mEdgeGlowRight:Lcom/android/launcher3/util/i0;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mFreeScroll:Z

    .line 54
    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-boolean v0, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 66
    .line 67
    iput-boolean v1, p0, Lcom/android/launcher3/V4;->mIsPageInTransition:Z

    .line 68
    .line 69
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->r3()V

    .line 70
    .line 71
    .line 72
    iget-boolean v0, p0, Lcom/android/launcher3/Workspace;->p:Z

    .line 73
    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {}, Lx1/O;->e2()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    new-instance v0, Lcom/android/launcher3/H6;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Lcom/android/launcher3/H6;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 93
    .line 94
    .line 95
    const-wide/16 v2, 0x1f4

    .line 96
    .line 97
    invoke-virtual {p0, v0, v2, v3}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    const/4 v0, 0x1

    .line 102
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->F2(Z)V

    .line 103
    .line 104
    .line 105
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n0:Lcom/android/launcher3/dragndrop/j$b;

    .line 106
    .line 107
    if-eqz v0, :cond_5

    .line 108
    .line 109
    invoke-interface {v0}, Lcom/android/launcher3/dragndrop/j$b;->v()V

    .line 110
    .line 111
    .line 112
    :cond_5
    const/4 v0, 0x0

    .line 113
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 114
    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    const-string v3, "onDragEnd mOutlineProvider:"

    .line 121
    .line 122
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v3, p0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 126
    .line 127
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    const-string v3, "Launcher.Workspace"

    .line 135
    .line 136
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 140
    .line 141
    if-eqz v2, :cond_6

    .line 142
    .line 143
    invoke-virtual {v2}, Ln1/d;->r()V

    .line 144
    .line 145
    .line 146
    :cond_6
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->s0:Ln1/d;

    .line 147
    .line 148
    iput-object v0, p0, Lcom/android/launcher3/Workspace;->m:Lcom/android/launcher3/K5;

    .line 149
    .line 150
    iget-boolean v2, p0, Lcom/android/launcher3/Workspace;->x0:Z

    .line 151
    .line 152
    if-nez v2, :cond_7

    .line 153
    .line 154
    invoke-direct {p0, v1, v1}, Lcom/android/launcher3/Workspace;->W0(ZZ)V

    .line 155
    .line 156
    .line 157
    :cond_7
    iput-boolean v1, p0, Lcom/android/launcher3/Workspace;->x0:Z

    .line 158
    .line 159
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 160
    .line 161
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    sget-object v3, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 166
    .line 167
    invoke-virtual {v2, v3}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-eqz v2, :cond_8

    .line 172
    .line 173
    invoke-direct {p0, v0}, Lcom/android/launcher3/Workspace;->z0(Lcom/android/launcher3/n0$a;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 177
    .line 178
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0}, Lcom/android/launcher3/menu/c;->u()V

    .line 183
    .line 184
    .line 185
    :cond_8
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->q0:Lp1/e;

    .line 186
    .line 187
    if-eqz v0, :cond_9

    .line 188
    .line 189
    invoke-virtual {v0}, Lp1/e;->e()V

    .line 190
    .line 191
    .line 192
    :cond_9
    invoke-static {}, Lm1/a;->a()Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-nez v0, :cond_a

    .line 197
    .line 198
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 199
    .line 200
    if-eqz v0, :cond_a

    .line 201
    .line 202
    invoke-virtual {v0, v1}, Lp1/a;->i(Z)V

    .line 203
    .line 204
    .line 205
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 206
    .line 207
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->w0()V

    .line 212
    .line 213
    .line 214
    :cond_a
    return-void
.end method

.method public v1(II)Lcom/android/launcher3/CellLayout;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "Launcher.Workspace"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "Screen id "

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, " already exists! insertIndex:"

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget-object v2, Lf1/a;->c:Lf1/a$a;

    .line 51
    .line 52
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    const/4 v3, 0x0

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->K0:Z

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const v2, 0x7f0e027f

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const v2, 0x7f0e027e

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 97
    .line 98
    :goto_0
    invoke-virtual {v0, p0}, Lcom/android/launcher3/CellLayout;->setCellLayoutContainer(Lcom/android/launcher3/S;)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->v0:Lcom/android/launcher3/touch/J;

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 104
    .line 105
    .line 106
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->v0:Lcom/android/launcher3/touch/J;

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lx1/O;->k1()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_3

    .line 116
    .line 117
    if-eqz p1, :cond_2

    .line 118
    .line 119
    invoke-static {p1}, Lx1/O;->b2(I)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_3

    .line 124
    .line 125
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->d()V

    .line 126
    .line 127
    .line 128
    :cond_3
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_4

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->l(Landroid/content/Context;)I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-lez v2, :cond_4

    .line 143
    .line 144
    if-ne p1, v2, :cond_4

    .line 145
    .line 146
    new-instance v2, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 149
    .line 150
    .line 151
    const-string v4, "insertNewWorkspaceScreen is aiFutureScreenId screenId="

    .line 152
    .line 153
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v4, " old insertIndex="

    .line 160
    .line 161
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    move p2, v3

    .line 175
    :cond_4
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->n:Lcom/android/launcher3/util/A0;

    .line 176
    .line 177
    invoke-virtual {v2, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 181
    .line 182
    invoke-virtual {v2, p2, p1}, Lcom/android/launcher3/util/x0;->n(II)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0, v0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 186
    .line 187
    .line 188
    new-instance p1, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    const-string v2, "insertNewWorkspaceScreen: "

    .line 194
    .line 195
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 199
    .line 200
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {v2}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v2, "="

    .line 212
    .line 213
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-object v2, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 217
    .line 218
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    invoke-virtual {v2}, Lcom/android/launcher3/statemanager/d;->F()Lcom/android/launcher3/statemanager/a;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    iget-object p1, p0, Lcom/android/launcher3/Workspace;->j0:Lcom/android/launcher3/N6;

    .line 237
    .line 238
    iget-object v1, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 239
    .line 240
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    check-cast v1, Lcom/android/launcher3/V3;

    .line 249
    .line 250
    invoke-virtual {p1, v1, v0, p2}, Lcom/android/launcher3/N6;->a(Lcom/android/launcher3/V3;Lcom/android/launcher3/CellLayout;I)V

    .line 251
    .line 252
    .line 253
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->x3()V

    .line 254
    .line 255
    .line 256
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->q3()V

    .line 257
    .line 258
    .line 259
    return-object v0
.end method

.method public v2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->E:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->i0:Z

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    iput v0, p0, Lcom/android/launcher3/Workspace;->e0:F

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->r3()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->n3()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public v3(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/t6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/t6;-><init>(Lcom/android/launcher3/Workspace;Ljava/util/List;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/Folder;->w1(Lcom/android/launcher3/util/Y0$a;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public w1(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/Workspace;->v1(II)Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x1(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    const/16 v1, -0xc9

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/x0;->w(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->o:Lcom/android/launcher3/util/x0;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/Workspace;->v1(II)Lcom/android/launcher3/CellLayout;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public x2(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0, p2, p3}, Lcom/android/launcher3/Workspace;->e3(ZLcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 8
    .line 9
    .line 10
    instance-of p0, p1, Lcom/android/launcher3/CellLayout;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string p2, "no cell found, cell layout occupied: "

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getOccupied()Lcom/android/launcher3/util/t0;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "Launcher.Workspace"

    .line 38
    .line 39
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public y1()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->F1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/Workspace;->D0:F

    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-static {p0, v0}, Ljava/lang/Float;->compare(FF)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public y2()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/Workspace;->E:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/Workspace;->e0:F

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/Workspace;->r3()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method y3(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/android/launcher3/z6;

    .line 7
    .line 8
    invoke-direct {p1, v0}, Lcom/android/launcher3/z6;-><init>(Ljava/util/HashSet;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/Folder;->w1(Lcom/android/launcher3/util/Y0$a;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 46

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p1

    .line 4
    .line 5
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 6
    .line 7
    invoke-virtual {v7, v1}, Lcom/android/launcher3/n0$a;->a([F)[F

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 12
    .line 13
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->w:Lcom/android/launcher3/CellLayout;

    .line 14
    .line 15
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const-string v9, "Launcher.Workspace"

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    iget-boolean v1, v0, Lcom/android/launcher3/Workspace;->Q:Z

    .line 38
    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v3, "onDrop: removeAppsFromPrivateFolderIfNecessary dragInfo : "

    .line 47
    .line 48
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v3, v7, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 52
    .line 53
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v9, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 64
    .line 65
    iget-object v3, v7, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/android/launcher3/resource/h1;->z0(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    if-eqz v2, :cond_2

    .line 71
    .line 72
    sget-object v1, Lf1/a;->x:Lf1/a$a;

    .line 73
    .line 74
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_1

    .line 87
    .line 88
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 95
    .line 96
    invoke-virtual {v0, v1, v3}, Lcom/android/launcher3/Workspace;->q2(Lcom/android/launcher3/Hotseat;[F)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 101
    .line 102
    invoke-direct {v0, v2, v1}, Lcom/android/launcher3/Workspace;->n2(Lcom/android/launcher3/CellLayout;[F)V

    .line 103
    .line 104
    .line 105
    :cond_2
    :goto_0
    iget-object v1, v7, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 106
    .line 107
    const/4 v10, 0x0

    .line 108
    const/4 v11, 0x1

    .line 109
    if-ne v1, v0, :cond_3

    .line 110
    .line 111
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 112
    .line 113
    if-nez v3, :cond_5

    .line 114
    .line 115
    :cond_3
    instance-of v1, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 116
    .line 117
    if-eqz v1, :cond_4

    .line 118
    .line 119
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->q()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_5

    .line 130
    .line 131
    :cond_4
    move-object v5, v2

    .line 132
    move-object v11, v7

    .line 133
    goto/16 :goto_2b

    .line 134
    .line 135
    :cond_5
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 136
    .line 137
    iget-object v12, v1, Lc1/a;->e:Landroid/view/View;

    .line 138
    .line 139
    const/4 v13, 0x5

    .line 140
    const/4 v14, 0x4

    .line 141
    const/4 v15, 0x2

    .line 142
    const/16 v20, -0x1

    .line 143
    .line 144
    if-eqz v2, :cond_33

    .line 145
    .line 146
    iget-boolean v3, v7, Lcom/android/launcher3/n0$a;->j:Z

    .line 147
    .line 148
    if-nez v3, :cond_33

    .line 149
    .line 150
    invoke-virtual {v0, v12}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    if-eq v3, v2, :cond_6

    .line 155
    .line 156
    move/from16 v21, v11

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_6
    move/from16 v21, v10

    .line 160
    .line 161
    :goto_1
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 162
    .line 163
    invoke-virtual {v3, v2}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 164
    .line 165
    .line 166
    move-result v22

    .line 167
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 168
    .line 169
    invoke-virtual {v0, v12}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v3, v4}, Lcom/android/launcher3/C2;->Q2(Landroid/view/View;)Z

    .line 174
    .line 175
    .line 176
    move-result v23

    .line 177
    const/16 v4, -0x65

    .line 178
    .line 179
    if-eqz v22, :cond_7

    .line 180
    .line 181
    move/from16 v26, v4

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_7
    const/16 v26, -0x64

    .line 185
    .line 186
    :goto_2
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 187
    .line 188
    aget v5, v5, v10

    .line 189
    .line 190
    if-gez v5, :cond_8

    .line 191
    .line 192
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 193
    .line 194
    iget v5, v5, Lc1/a;->f:I

    .line 195
    .line 196
    :goto_3
    move/from16 v27, v5

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_8
    invoke-virtual {v0, v2}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 200
    .line 201
    .line 202
    move-result v5

    .line 203
    goto :goto_3

    .line 204
    :goto_4
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 205
    .line 206
    if-eqz v5, :cond_9

    .line 207
    .line 208
    iget v6, v5, Lcom/android/launcher3/util/C;->c:I

    .line 209
    .line 210
    goto :goto_5

    .line 211
    :cond_9
    move v6, v11

    .line 212
    :goto_5
    if-eqz v5, :cond_a

    .line 213
    .line 214
    iget v5, v5, Lcom/android/launcher3/util/C;->d:I

    .line 215
    .line 216
    goto :goto_6

    .line 217
    :cond_a
    move v5, v11

    .line 218
    :goto_6
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 219
    .line 220
    aget v3, v1, v10

    .line 221
    .line 222
    float-to-int v3, v3

    .line 223
    aget v1, v1, v11

    .line 224
    .line 225
    float-to-int v1, v1

    .line 226
    move/from16 v18, v4

    .line 227
    .line 228
    move v4, v5

    .line 229
    move-object v5, v2

    .line 230
    move v2, v1

    .line 231
    move v1, v3

    .line 232
    move v3, v6

    .line 233
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 234
    .line 235
    move/from16 v33, v27

    .line 236
    .line 237
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/Workspace;->a1(IIIILcom/android/launcher3/CellLayout;[I)[I

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    move-object v2, v5

    .line 242
    iput-object v1, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 243
    .line 244
    iget-boolean v5, v0, Lcom/android/launcher3/Workspace;->r0:Z

    .line 245
    .line 246
    if-eqz v5, :cond_b

    .line 247
    .line 248
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 249
    .line 250
    aget v6, v5, v10

    .line 251
    .line 252
    aget v5, v5, v11

    .line 253
    .line 254
    invoke-virtual {v2, v6, v5, v1}, Lcom/android/launcher3/CellLayout;->K(FF[I)F

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    :goto_7
    move v5, v1

    .line 259
    move v1, v4

    .line 260
    goto :goto_8

    .line 261
    :cond_b
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 262
    .line 263
    invoke-direct {v0, v1, v5, v2}, Lcom/android/launcher3/Workspace;->d1([I[FLcom/android/launcher3/CellLayout;)F

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    goto :goto_7

    .line 268
    :goto_8
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 269
    .line 270
    const/4 v6, 0x0

    .line 271
    move/from16 v34, v1

    .line 272
    .line 273
    move-object v1, v12

    .line 274
    move v12, v3

    .line 275
    move-object v3, v2

    .line 276
    move/from16 v2, v26

    .line 277
    .line 278
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/Workspace;->R0(Landroid/view/View;ILcom/android/launcher3/CellLayout;[IFZLcom/android/launcher3/n0$a;)Z

    .line 279
    .line 280
    .line 281
    move-result v4

    .line 282
    move v7, v2

    .line 283
    move-object v2, v3

    .line 284
    if-nez v4, :cond_31

    .line 285
    .line 286
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 287
    .line 288
    const/4 v6, 0x0

    .line 289
    move v4, v5

    .line 290
    move-object/from16 v5, p1

    .line 291
    .line 292
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/Workspace;->C0(Landroid/view/View;Lcom/android/launcher3/CellLayout;[IFLcom/android/launcher3/n0$a;Z)Z

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    if-eqz v3, :cond_c

    .line 297
    .line 298
    goto/16 :goto_1e

    .line 299
    .line 300
    :cond_c
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 301
    .line 302
    const/4 v6, 0x0

    .line 303
    move-object/from16 v5, p1

    .line 304
    .line 305
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/Workspace;->C0(Landroid/view/View;Lcom/android/launcher3/CellLayout;[IFLcom/android/launcher3/n0$a;Z)Z

    .line 306
    .line 307
    .line 308
    move-result v3

    .line 309
    move-object/from16 v16, v1

    .line 310
    .line 311
    move-object v1, v5

    .line 312
    if-eqz v3, :cond_e

    .line 313
    .line 314
    sget-object v2, Lf1/a;->x:Lf1/a$a;

    .line 315
    .line 316
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    .line 317
    .line 318
    .line 319
    move-result v2

    .line 320
    if-eqz v2, :cond_d

    .line 321
    .line 322
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 323
    .line 324
    invoke-virtual {v2}, Lp1/a;->p()V

    .line 325
    .line 326
    .line 327
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 328
    .line 329
    invoke-virtual {v2, v1, v10}, Lp1/a;->g(Lcom/android/launcher3/n0$a;Z)V

    .line 330
    .line 331
    .line 332
    :cond_d
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 333
    .line 334
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->q()Z

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-eqz v1, :cond_32

    .line 343
    .line 344
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 345
    .line 346
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 359
    .line 360
    .line 361
    move-result v2

    .line 362
    if-eqz v2, :cond_32

    .line 363
    .line 364
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    check-cast v2, Landroid/view/View;

    .line 369
    .line 370
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 371
    .line 372
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 373
    .line 374
    .line 375
    move-result-object v3

    .line 376
    invoke-virtual {v3, v2}, Lcom/android/launcher3/Workspace;->K2(Landroid/view/View;)V

    .line 377
    .line 378
    .line 379
    goto :goto_9

    .line 380
    :cond_e
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 381
    .line 382
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 383
    .line 384
    .line 385
    move-result-object v3

    .line 386
    invoke-virtual {v3}, Lcom/android/launcher3/G4;->q()Z

    .line 387
    .line 388
    .line 389
    move-result v3

    .line 390
    if-eqz v3, :cond_f

    .line 391
    .line 392
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 393
    .line 394
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 395
    .line 396
    .line 397
    move-result-object v2

    .line 398
    invoke-virtual {v2, v1}, Lcom/android/launcher3/menu/c;->b(Lcom/android/launcher3/n0$a;)V

    .line 399
    .line 400
    .line 401
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 402
    .line 403
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->q()Z

    .line 408
    .line 409
    .line 410
    move-result v1

    .line 411
    if-eqz v1, :cond_32

    .line 412
    .line 413
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 414
    .line 415
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 416
    .line 417
    .line 418
    move-result-object v1

    .line 419
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 420
    .line 421
    .line 422
    move-result-object v1

    .line 423
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 424
    .line 425
    .line 426
    move-result-object v1

    .line 427
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 428
    .line 429
    .line 430
    move-result v2

    .line 431
    if-eqz v2, :cond_32

    .line 432
    .line 433
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object v2

    .line 437
    check-cast v2, Landroid/view/View;

    .line 438
    .line 439
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 440
    .line 441
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 442
    .line 443
    .line 444
    move-result-object v3

    .line 445
    invoke-virtual {v3, v2}, Lcom/android/launcher3/Workspace;->K2(Landroid/view/View;)V

    .line 446
    .line 447
    .line 448
    goto :goto_a

    .line 449
    :cond_f
    iget-object v3, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 450
    .line 451
    iget v4, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 452
    .line 453
    iget v5, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 454
    .line 455
    iget v6, v3, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 456
    .line 457
    move/from16 v17, v10

    .line 458
    .line 459
    if-lez v6, :cond_10

    .line 460
    .line 461
    iget v10, v3, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 462
    .line 463
    if-lez v10, :cond_10

    .line 464
    .line 465
    move v4, v6

    .line 466
    move v5, v10

    .line 467
    :cond_10
    new-array v6, v15, [I

    .line 468
    .line 469
    aput v20, v6, v17

    .line 470
    .line 471
    aput v20, v6, v11

    .line 472
    .line 473
    sget-object v24, Lf1/a;->x:Lf1/a$a;

    .line 474
    .line 475
    invoke-virtual/range {v24 .. v24}, Lf1/a$a;->c()Z

    .line 476
    .line 477
    .line 478
    move-result v10

    .line 479
    if-eqz v10, :cond_12

    .line 480
    .line 481
    if-eqz v22, :cond_12

    .line 482
    .line 483
    if-eqz v21, :cond_12

    .line 484
    .line 485
    iget-object v10, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 486
    .line 487
    aget v15, v10, v17

    .line 488
    .line 489
    aput v15, v6, v17

    .line 490
    .line 491
    aget v10, v10, v11

    .line 492
    .line 493
    aput v10, v6, v11

    .line 494
    .line 495
    if-ltz v15, :cond_12

    .line 496
    .line 497
    if-ltz v10, :cond_12

    .line 498
    .line 499
    invoke-virtual {v2, v15, v10}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 500
    .line 501
    .line 502
    move-result-object v10

    .line 503
    if-eqz v10, :cond_11

    .line 504
    .line 505
    iget v15, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 506
    .line 507
    if-ne v15, v11, :cond_11

    .line 508
    .line 509
    iget v15, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 510
    .line 511
    if-ne v15, v11, :cond_11

    .line 512
    .line 513
    iget v15, v3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 514
    .line 515
    if-eq v15, v14, :cond_11

    .line 516
    .line 517
    if-eq v15, v13, :cond_11

    .line 518
    .line 519
    move/from16 v25, v11

    .line 520
    .line 521
    goto :goto_b

    .line 522
    :cond_11
    move/from16 v25, v17

    .line 523
    .line 524
    goto :goto_b

    .line 525
    :cond_12
    move/from16 v25, v17

    .line 526
    .line 527
    const/4 v10, 0x0

    .line 528
    :goto_b
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getCellPosMapper()Lc1/c;

    .line 529
    .line 530
    .line 531
    move-result-object v15

    .line 532
    invoke-virtual {v15, v3}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 533
    .line 534
    .line 535
    move-result-object v15

    .line 536
    move/from16 v19, v11

    .line 537
    .line 538
    iget v11, v15, Lc1/c$a;->c:I

    .line 539
    .line 540
    move/from16 v26, v4

    .line 541
    .line 542
    move/from16 v4, v33

    .line 543
    .line 544
    if-ne v11, v4, :cond_13

    .line 545
    .line 546
    iget v11, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 547
    .line 548
    if-ne v11, v7, :cond_13

    .line 549
    .line 550
    iget v11, v15, Lc1/c$a;->a:I

    .line 551
    .line 552
    iget-object v13, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 553
    .line 554
    aget v14, v13, v17

    .line 555
    .line 556
    if-ne v11, v14, :cond_13

    .line 557
    .line 558
    iget v11, v15, Lc1/c$a;->b:I

    .line 559
    .line 560
    aget v13, v13, v19

    .line 561
    .line 562
    if-ne v11, v13, :cond_13

    .line 563
    .line 564
    move/from16 v11, v19

    .line 565
    .line 566
    goto :goto_c

    .line 567
    :cond_13
    move/from16 v11, v17

    .line 568
    .line 569
    :goto_c
    if-eqz v11, :cond_14

    .line 570
    .line 571
    iget-boolean v13, v0, Lcom/android/launcher3/Workspace;->E:Z

    .line 572
    .line 573
    if-eqz v13, :cond_14

    .line 574
    .line 575
    move/from16 v13, v19

    .line 576
    .line 577
    goto :goto_d

    .line 578
    :cond_14
    move/from16 v13, v17

    .line 579
    .line 580
    :goto_d
    iget-object v14, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 581
    .line 582
    invoke-virtual {v14}, Lcom/android/launcher3/C2;->u2()Z

    .line 583
    .line 584
    .line 585
    move-result v14

    .line 586
    if-nez v14, :cond_17

    .line 587
    .line 588
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->E1()Z

    .line 589
    .line 590
    .line 591
    move-result v14

    .line 592
    if-nez v14, :cond_15

    .line 593
    .line 594
    if-nez v13, :cond_15

    .line 595
    .line 596
    iget-object v14, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 597
    .line 598
    aget v15, v14, v17

    .line 599
    .line 600
    aget v14, v14, v19

    .line 601
    .line 602
    move/from16 v29, v5

    .line 603
    .line 604
    move/from16 v5, v34

    .line 605
    .line 606
    invoke-virtual {v2, v15, v14, v12, v5}, Lcom/android/launcher3/CellLayout;->c0(IIII)Z

    .line 607
    .line 608
    .line 609
    move-result v14

    .line 610
    if-nez v14, :cond_16

    .line 611
    .line 612
    goto :goto_f

    .line 613
    :cond_15
    move/from16 v29, v5

    .line 614
    .line 615
    move/from16 v5, v34

    .line 616
    .line 617
    :cond_16
    move/from16 v15, v17

    .line 618
    .line 619
    :goto_e
    move-object/from16 v18, v2

    .line 620
    .line 621
    const/4 v14, 0x2

    .line 622
    goto :goto_10

    .line 623
    :cond_17
    move/from16 v29, v5

    .line 624
    .line 625
    move/from16 v5, v34

    .line 626
    .line 627
    :goto_f
    move/from16 v15, v19

    .line 628
    .line 629
    goto :goto_e

    .line 630
    :goto_10
    new-array v2, v14, [I

    .line 631
    .line 632
    new-instance v14, Ljava/lang/StringBuilder;

    .line 633
    .line 634
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 635
    .line 636
    .line 637
    move-object/from16 v31, v2

    .line 638
    .line 639
    const-string v2, "onDrop: nearest target cell: "

    .line 640
    .line 641
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 642
    .line 643
    .line 644
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 645
    .line 646
    aget v2, v2, v17

    .line 647
    .line 648
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 649
    .line 650
    .line 651
    const-string v2, ", "

    .line 652
    .line 653
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 654
    .line 655
    .line 656
    move/from16 v34, v5

    .line 657
    .line 658
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 659
    .line 660
    aget v5, v5, v19

    .line 661
    .line 662
    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 663
    .line 664
    .line 665
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 666
    .line 667
    .line 668
    move-result-object v5

    .line 669
    invoke-static {v9, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    .line 671
    .line 672
    if-eqz v15, :cond_18

    .line 673
    .line 674
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 675
    .line 676
    aput v20, v5, v19

    .line 677
    .line 678
    aput v20, v5, v17

    .line 679
    .line 680
    move-object/from16 v27, v6

    .line 681
    .line 682
    move-object v5, v9

    .line 683
    move v8, v11

    .line 684
    move v14, v12

    .line 685
    move v6, v13

    .line 686
    move v1, v15

    .line 687
    move-object/from16 v11, v16

    .line 688
    .line 689
    move-object/from16 v9, v18

    .line 690
    .line 691
    move/from16 v35, v19

    .line 692
    .line 693
    move/from16 v12, v26

    .line 694
    .line 695
    move/from16 v13, v29

    .line 696
    .line 697
    move/from16 v15, v34

    .line 698
    .line 699
    const/16 v33, 0x2

    .line 700
    .line 701
    move-object/from16 v34, v10

    .line 702
    .line 703
    move/from16 v26, v17

    .line 704
    .line 705
    goto :goto_11

    .line 706
    :cond_18
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 707
    .line 708
    aget v14, v5, v17

    .line 709
    .line 710
    float-to-int v14, v14

    .line 711
    aget v5, v5, v19

    .line 712
    .line 713
    float-to-int v5, v5

    .line 714
    move/from16 v33, v5

    .line 715
    .line 716
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 717
    .line 718
    move/from16 v35, v19

    .line 719
    .line 720
    const/16 v19, 0x2

    .line 721
    .line 722
    move-object/from16 v27, v6

    .line 723
    .line 724
    move v8, v11

    .line 725
    move v6, v13

    .line 726
    move v1, v15

    .line 727
    move/from16 v13, v29

    .line 728
    .line 729
    move/from16 v11, v33

    .line 730
    .line 731
    move/from16 v15, v34

    .line 732
    .line 733
    const/16 v33, 0x2

    .line 734
    .line 735
    move-object/from16 v34, v10

    .line 736
    .line 737
    move v10, v14

    .line 738
    move v14, v12

    .line 739
    move/from16 v12, v26

    .line 740
    .line 741
    move/from16 v26, v17

    .line 742
    .line 743
    move-object/from16 v17, v5

    .line 744
    .line 745
    move-object v5, v9

    .line 746
    move-object/from16 v9, v18

    .line 747
    .line 748
    move-object/from16 v18, v31

    .line 749
    .line 750
    invoke-virtual/range {v9 .. v19}, Lcom/android/launcher3/CellLayout;->n0(IIIIIILandroid/view/View;[I[II)[I

    .line 751
    .line 752
    .line 753
    move-result-object v10

    .line 754
    move-object/from16 v11, v16

    .line 755
    .line 756
    iput-object v10, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 757
    .line 758
    :goto_11
    new-instance v10, Ljava/lang/StringBuilder;

    .line 759
    .line 760
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 761
    .line 762
    .line 763
    move-object/from16 v18, v9

    .line 764
    .line 765
    const-string v9, "onDrop: drop on original cell: "

    .line 766
    .line 767
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 768
    .line 769
    .line 770
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 771
    .line 772
    .line 773
    const-string v9, ", during transition: "

    .line 774
    .line 775
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 776
    .line 777
    .line 778
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 779
    .line 780
    .line 781
    const-string v9, ", prevent shuffling: "

    .line 782
    .line 783
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 784
    .line 785
    .line 786
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 787
    .line 788
    .line 789
    const-string v9, ", visual center: "

    .line 790
    .line 791
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 792
    .line 793
    .line 794
    iget-object v9, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 795
    .line 796
    aget v9, v9, v26

    .line 797
    .line 798
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 799
    .line 800
    .line 801
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 802
    .line 803
    .line 804
    iget-object v9, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 805
    .line 806
    aget v9, v9, v35

    .line 807
    .line 808
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 809
    .line 810
    .line 811
    const-string v9, ", min span: "

    .line 812
    .line 813
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 814
    .line 815
    .line 816
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 817
    .line 818
    .line 819
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 820
    .line 821
    .line 822
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 823
    .line 824
    .line 825
    const-string v9, ", span: "

    .line 826
    .line 827
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 828
    .line 829
    .line 830
    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 831
    .line 832
    .line 833
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 834
    .line 835
    .line 836
    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 837
    .line 838
    .line 839
    const-string v9, ", target cell: "

    .line 840
    .line 841
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 842
    .line 843
    .line 844
    iget-object v9, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 845
    .line 846
    aget v9, v9, v26

    .line 847
    .line 848
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 849
    .line 850
    .line 851
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 852
    .line 853
    .line 854
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 855
    .line 856
    aget v2, v2, v35

    .line 857
    .line 858
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 859
    .line 860
    .line 861
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 862
    .line 863
    .line 864
    move-result-object v2

    .line 865
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 866
    .line 867
    .line 868
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 869
    .line 870
    aget v9, v2, v26

    .line 871
    .line 872
    if-ltz v9, :cond_19

    .line 873
    .line 874
    aget v2, v2, v35

    .line 875
    .line 876
    if-ltz v2, :cond_19

    .line 877
    .line 878
    move/from16 v10, v35

    .line 879
    .line 880
    goto :goto_12

    .line 881
    :cond_19
    move/from16 v10, v26

    .line 882
    .line 883
    :goto_12
    invoke-virtual/range {v24 .. v24}, Lf1/a$a;->c()Z

    .line 884
    .line 885
    .line 886
    move-result v2

    .line 887
    if-eqz v2, :cond_1a

    .line 888
    .line 889
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 890
    .line 891
    invoke-virtual {v2, v10}, Lp1/a;->k(Z)V

    .line 892
    .line 893
    .line 894
    :cond_1a
    if-eqz v10, :cond_1c

    .line 895
    .line 896
    instance-of v2, v11, Landroid/appwidget/AppWidgetHostView;

    .line 897
    .line 898
    if-eqz v2, :cond_1c

    .line 899
    .line 900
    aget v2, v31, v26

    .line 901
    .line 902
    iget v9, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 903
    .line 904
    if-ne v2, v9, :cond_1b

    .line 905
    .line 906
    aget v9, v31, v35

    .line 907
    .line 908
    iget v12, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 909
    .line 910
    if-eq v9, v12, :cond_1c

    .line 911
    .line 912
    :cond_1b
    iput v2, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 913
    .line 914
    aget v9, v31, v35

    .line 915
    .line 916
    iput v9, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 917
    .line 918
    move-object v12, v11

    .line 919
    check-cast v12, Landroid/appwidget/AppWidgetHostView;

    .line 920
    .line 921
    iget-object v13, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 922
    .line 923
    invoke-static {v12, v13, v2, v9}, Lr2/b;->i(Landroid/appwidget/AppWidgetHostView;Landroid/content/Context;II)V

    .line 924
    .line 925
    .line 926
    move/from16 v9, v35

    .line 927
    .line 928
    goto :goto_13

    .line 929
    :cond_1c
    move/from16 v9, v26

    .line 930
    .line 931
    :goto_13
    if-eqz v10, :cond_28

    .line 932
    .line 933
    invoke-virtual {v0, v4}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 934
    .line 935
    .line 936
    move-result v1

    .line 937
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->getLeftmostVisiblePageForIndex(I)I

    .line 938
    .line 939
    .line 940
    move-result v1

    .line 941
    iget v2, v0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 942
    .line 943
    if-eq v1, v2, :cond_1d

    .line 944
    .line 945
    if-nez v22, :cond_1d

    .line 946
    .line 947
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 948
    .line 949
    .line 950
    move/from16 v10, v35

    .line 951
    .line 952
    goto :goto_14

    .line 953
    :cond_1d
    move/from16 v10, v26

    .line 954
    .line 955
    :goto_14
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 956
    .line 957
    invoke-virtual {v1}, Lcom/android/launcher3/dragndrop/j;->H()Z

    .line 958
    .line 959
    .line 960
    move-result v1

    .line 961
    if-nez v1, :cond_1e

    .line 962
    .line 963
    int-to-long v1, v7

    .line 964
    invoke-direct {v0, v1, v2, v11}, Lcom/android/launcher3/Workspace;->a3(JLandroid/view/View;)V

    .line 965
    .line 966
    .line 967
    :cond_1e
    invoke-virtual {v11}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 968
    .line 969
    .line 970
    move-result-object v1

    .line 971
    move-object v12, v1

    .line 972
    check-cast v12, Lcom/android/launcher3/model/data/y;

    .line 973
    .line 974
    if-eqz v21, :cond_22

    .line 975
    .line 976
    invoke-virtual {v0, v11}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 977
    .line 978
    .line 979
    move-result-object v1

    .line 980
    if-eqz v1, :cond_20

    .line 981
    .line 982
    invoke-virtual {v1, v11}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 983
    .line 984
    .line 985
    :cond_1f
    move-object/from16 v1, p1

    .line 986
    .line 987
    move/from16 v13, v26

    .line 988
    .line 989
    goto :goto_15

    .line 990
    :cond_20
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 991
    .line 992
    iget-object v1, v1, Lc1/a;->e:Landroid/view/View;

    .line 993
    .line 994
    instance-of v1, v1, Lcom/android/launcher3/widget/T;

    .line 995
    .line 996
    if-eqz v1, :cond_1f

    .line 997
    .line 998
    move-object/from16 v1, p1

    .line 999
    .line 1000
    iget-object v2, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 1001
    .line 1002
    move/from16 v13, v26

    .line 1003
    .line 1004
    invoke-virtual {v2, v13}, Lcom/android/launcher3/dragndrop/v;->r(Z)V

    .line 1005
    .line 1006
    .line 1007
    :goto_15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1008
    .line 1009
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1010
    .line 1011
    .line 1012
    const-string v14, "onDrop, screenId:"

    .line 1013
    .line 1014
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1015
    .line 1016
    .line 1017
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1018
    .line 1019
    .line 1020
    const-string v14, " mTargetCell[0]:"

    .line 1021
    .line 1022
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1023
    .line 1024
    .line 1025
    iget-object v14, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1026
    .line 1027
    aget v14, v14, v13

    .line 1028
    .line 1029
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1030
    .line 1031
    .line 1032
    const-string v13, " mTargetCell[1]:"

    .line 1033
    .line 1034
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1035
    .line 1036
    .line 1037
    iget-object v13, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1038
    .line 1039
    aget v13, v13, v35

    .line 1040
    .line 1041
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1042
    .line 1043
    .line 1044
    const-string v13, " info.spanX:"

    .line 1045
    .line 1046
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1047
    .line 1048
    .line 1049
    iget v13, v12, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1050
    .line 1051
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1052
    .line 1053
    .line 1054
    const-string v13, " info.spanY:"

    .line 1055
    .line 1056
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1057
    .line 1058
    .line 1059
    iget v13, v12, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1060
    .line 1061
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1062
    .line 1063
    .line 1064
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1065
    .line 1066
    .line 1067
    move-result-object v2

    .line 1068
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1069
    .line 1070
    .line 1071
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1072
    .line 1073
    move/from16 v27, v4

    .line 1074
    .line 1075
    const/16 v26, 0x0

    .line 1076
    .line 1077
    aget v4, v2, v26

    .line 1078
    .line 1079
    aget v2, v2, v35

    .line 1080
    .line 1081
    move/from16 v17, v6

    .line 1082
    .line 1083
    iget v6, v12, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1084
    .line 1085
    move-object v13, v5

    .line 1086
    move v5, v2

    .line 1087
    move v2, v7

    .line 1088
    iget v7, v12, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1089
    .line 1090
    move-object v14, v11

    .line 1091
    move-object v11, v1

    .line 1092
    move-object v1, v14

    .line 1093
    move-object v15, v3

    .line 1094
    move/from16 v14, v26

    .line 1095
    .line 1096
    move/from16 v3, v27

    .line 1097
    .line 1098
    invoke-interface/range {v0 .. v7}, Lcom/android/launcher3/M6;->q(Landroid/view/View;IIIIII)V

    .line 1099
    .line 1100
    .line 1101
    move-object v6, v1

    .line 1102
    invoke-static {}, Lx1/O;->C3()Z

    .line 1103
    .line 1104
    .line 1105
    move-result v1

    .line 1106
    move-object/from16 v4, v18

    .line 1107
    .line 1108
    if-eqz v1, :cond_21

    .line 1109
    .line 1110
    instance-of v1, v4, Lcom/android/launcher3/Hotseat;

    .line 1111
    .line 1112
    if-eqz v1, :cond_21

    .line 1113
    .line 1114
    const v1, 0x7f0b04bd

    .line 1115
    .line 1116
    .line 1117
    const/4 v5, 0x0

    .line 1118
    invoke-virtual {v4, v1, v5}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 1119
    .line 1120
    .line 1121
    goto :goto_16

    .line 1122
    :cond_21
    const/4 v5, 0x0

    .line 1123
    goto :goto_16

    .line 1124
    :cond_22
    move-object v15, v3

    .line 1125
    move v3, v4

    .line 1126
    move-object v13, v5

    .line 1127
    move/from16 v17, v6

    .line 1128
    .line 1129
    move v2, v7

    .line 1130
    move-object v6, v11

    .line 1131
    move-object/from16 v4, v18

    .line 1132
    .line 1133
    move/from16 v14, v26

    .line 1134
    .line 1135
    const/4 v5, 0x0

    .line 1136
    move-object/from16 v11, p1

    .line 1137
    .line 1138
    :goto_16
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 1139
    .line 1140
    .line 1141
    move-result-object v1

    .line 1142
    check-cast v1, Lc1/b;

    .line 1143
    .line 1144
    new-instance v7, Ljava/lang/StringBuilder;

    .line 1145
    .line 1146
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 1147
    .line 1148
    .line 1149
    const-string v5, "onDrop: originWidgetPosition_X = "

    .line 1150
    .line 1151
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1152
    .line 1153
    .line 1154
    iget v5, v12, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 1155
    .line 1156
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1157
    .line 1158
    .line 1159
    const-string v5, " originWidgetPosition_Y = "

    .line 1160
    .line 1161
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1162
    .line 1163
    .line 1164
    iget v5, v12, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 1165
    .line 1166
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1167
    .line 1168
    .line 1169
    const-string v5, " TargetCell_X = "

    .line 1170
    .line 1171
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1172
    .line 1173
    .line 1174
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1175
    .line 1176
    aget v5, v5, v14

    .line 1177
    .line 1178
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1179
    .line 1180
    .line 1181
    const-string v5, " TargetCell_Y = "

    .line 1182
    .line 1183
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1184
    .line 1185
    .line 1186
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1187
    .line 1188
    aget v5, v5, v35

    .line 1189
    .line 1190
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1191
    .line 1192
    .line 1193
    const-string v5, " originWidget_ScreenId = "

    .line 1194
    .line 1195
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1196
    .line 1197
    .line 1198
    iget v5, v12, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 1199
    .line 1200
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1201
    .line 1202
    .line 1203
    const-string v5, " TargetCell_ScreenId = "

    .line 1204
    .line 1205
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1206
    .line 1207
    .line 1208
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1209
    .line 1210
    .line 1211
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1212
    .line 1213
    .line 1214
    move-result-object v5

    .line 1215
    invoke-static {v13, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1216
    .line 1217
    .line 1218
    const/16 v5, -0x64

    .line 1219
    .line 1220
    if-ne v2, v5, :cond_23

    .line 1221
    .line 1222
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1223
    .line 1224
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 1225
    .line 1226
    .line 1227
    const-string v7, "onDrop: screen occupied: "

    .line 1228
    .line 1229
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1230
    .line 1231
    .line 1232
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getOccupied()Lcom/android/launcher3/util/t0;

    .line 1233
    .line 1234
    .line 1235
    move-result-object v7

    .line 1236
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1237
    .line 1238
    .line 1239
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1240
    .line 1241
    .line 1242
    move-result-object v5

    .line 1243
    invoke-static {v13, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1244
    .line 1245
    .line 1246
    :cond_23
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1247
    .line 1248
    aget v5, v5, v14

    .line 1249
    .line 1250
    invoke-virtual {v1, v5}, Lc1/b;->h(I)V

    .line 1251
    .line 1252
    .line 1253
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1254
    .line 1255
    aget v5, v5, v14

    .line 1256
    .line 1257
    invoke-virtual {v1, v5}, Lc1/b;->e(I)V

    .line 1258
    .line 1259
    .line 1260
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1261
    .line 1262
    aget v5, v5, v35

    .line 1263
    .line 1264
    invoke-virtual {v1, v5}, Lc1/b;->i(I)V

    .line 1265
    .line 1266
    .line 1267
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1268
    .line 1269
    aget v5, v5, v35

    .line 1270
    .line 1271
    invoke-virtual {v1, v5}, Lc1/b;->g(I)V

    .line 1272
    .line 1273
    .line 1274
    iget v5, v15, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1275
    .line 1276
    iput v5, v1, Lc1/b;->f:I

    .line 1277
    .line 1278
    iget v5, v15, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1279
    .line 1280
    iput v5, v1, Lc1/b;->g:I

    .line 1281
    .line 1282
    move/from16 v5, v35

    .line 1283
    .line 1284
    iput-boolean v5, v1, Lc1/b;->h:Z

    .line 1285
    .line 1286
    const/16 v5, -0x65

    .line 1287
    .line 1288
    if-eq v2, v5, :cond_24

    .line 1289
    .line 1290
    instance-of v7, v6, Lcom/android/launcher3/widget/T;

    .line 1291
    .line 1292
    if-eqz v7, :cond_24

    .line 1293
    .line 1294
    move-object v7, v6

    .line 1295
    check-cast v7, Lcom/android/launcher3/widget/T;

    .line 1296
    .line 1297
    move-object/from16 v13, p2

    .line 1298
    .line 1299
    invoke-direct {v0, v13, v7, v4, v15}, Lcom/android/launcher3/Workspace;->q1(Lcom/android/launcher3/dragndrop/p;Lcom/android/launcher3/widget/T;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;)Ljava/lang/Runnable;

    .line 1300
    .line 1301
    .line 1302
    move-result-object v7

    .line 1303
    goto :goto_17

    .line 1304
    :cond_24
    move-object/from16 v13, p2

    .line 1305
    .line 1306
    const/4 v7, 0x0

    .line 1307
    :goto_17
    if-eq v2, v5, :cond_25

    .line 1308
    .line 1309
    instance-of v5, v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 1310
    .line 1311
    if-eqz v5, :cond_25

    .line 1312
    .line 1313
    move-object v5, v6

    .line 1314
    check-cast v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 1315
    .line 1316
    iget-boolean v5, v13, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 1317
    .line 1318
    if-nez v5, :cond_25

    .line 1319
    .line 1320
    new-instance v5, Lcom/android/launcher3/g6;

    .line 1321
    .line 1322
    invoke-direct {v5, v0, v4, v15}, Lcom/android/launcher3/g6;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;)V

    .line 1323
    .line 1324
    .line 1325
    goto :goto_18

    .line 1326
    :cond_25
    move-object v5, v7

    .line 1327
    :goto_18
    iget-object v7, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1328
    .line 1329
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 1330
    .line 1331
    .line 1332
    move-result-object v24

    .line 1333
    invoke-virtual {v1}, Lc1/b;->a()I

    .line 1334
    .line 1335
    .line 1336
    move-result v28

    .line 1337
    invoke-virtual {v1}, Lc1/b;->b()I

    .line 1338
    .line 1339
    .line 1340
    move-result v29

    .line 1341
    iget v1, v15, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1342
    .line 1343
    iget v7, v15, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1344
    .line 1345
    move/from16 v30, v1

    .line 1346
    .line 1347
    move/from16 v26, v2

    .line 1348
    .line 1349
    move/from16 v27, v3

    .line 1350
    .line 1351
    move/from16 v31, v7

    .line 1352
    .line 1353
    move-object/from16 v25, v12

    .line 1354
    .line 1355
    invoke-virtual/range {v24 .. v31}, Lz1/J3;->R(Lcom/android/launcher3/model/data/y;IIIIII)V

    .line 1356
    .line 1357
    .line 1358
    if-nez v23, :cond_26

    .line 1359
    .line 1360
    if-eqz v22, :cond_27

    .line 1361
    .line 1362
    :cond_26
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1363
    .line 1364
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 1365
    .line 1366
    .line 1367
    move-result-object v1

    .line 1368
    invoke-virtual {v1}, Lcom/android/launcher3/Hotseat;->Z0()V

    .line 1369
    .line 1370
    .line 1371
    :cond_27
    move-object/from16 v44, v4

    .line 1372
    .line 1373
    move-object v1, v5

    .line 1374
    move-object v12, v6

    .line 1375
    const/16 v32, 0x0

    .line 1376
    .line 1377
    goto/16 :goto_1d

    .line 1378
    .line 1379
    :cond_28
    move-object v15, v3

    .line 1380
    move v3, v4

    .line 1381
    move-object v13, v5

    .line 1382
    move/from16 v17, v6

    .line 1383
    .line 1384
    move v2, v7

    .line 1385
    move-object v6, v11

    .line 1386
    move-object/from16 v4, v18

    .line 1387
    .line 1388
    move/from16 v14, v26

    .line 1389
    .line 1390
    move-object/from16 v11, p1

    .line 1391
    .line 1392
    if-nez v25, :cond_2d

    .line 1393
    .line 1394
    if-nez v1, :cond_2a

    .line 1395
    .line 1396
    if-eqz v22, :cond_29

    .line 1397
    .line 1398
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1399
    .line 1400
    iget v2, v1, Lcom/android/launcher3/util/C;->c:I

    .line 1401
    .line 1402
    const/4 v5, 0x1

    .line 1403
    if-ne v2, v5, :cond_2a

    .line 1404
    .line 1405
    iget v1, v1, Lcom/android/launcher3/util/C;->d:I

    .line 1406
    .line 1407
    if-ne v1, v5, :cond_2a

    .line 1408
    .line 1409
    iget-object v1, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 1410
    .line 1411
    instance-of v2, v1, Lcom/android/launcher3/model/data/A;

    .line 1412
    .line 1413
    if-nez v2, :cond_2a

    .line 1414
    .line 1415
    instance-of v1, v1, Lcom/android/launcher3/widget/z0;

    .line 1416
    .line 1417
    if-eqz v1, :cond_29

    .line 1418
    .line 1419
    goto :goto_19

    .line 1420
    :cond_29
    iget-object v1, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 1421
    .line 1422
    iget-object v2, v11, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 1423
    .line 1424
    invoke-virtual {v0, v4, v1, v2}, Lcom/android/launcher3/Workspace;->x2(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 1425
    .line 1426
    .line 1427
    :cond_2a
    :goto_19
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1428
    .line 1429
    iget-object v1, v1, Lc1/a;->e:Landroid/view/View;

    .line 1430
    .line 1431
    instance-of v1, v1, Lcom/android/launcher3/widget/T;

    .line 1432
    .line 1433
    if-eqz v1, :cond_2b

    .line 1434
    .line 1435
    iget-object v1, v11, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 1436
    .line 1437
    const/4 v5, 0x1

    .line 1438
    invoke-virtual {v1, v5}, Lcom/android/launcher3/dragndrop/v;->r(Z)V

    .line 1439
    .line 1440
    .line 1441
    goto :goto_1a

    .line 1442
    :cond_2b
    const/4 v5, 0x1

    .line 1443
    :goto_1a
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 1444
    .line 1445
    .line 1446
    move-result-object v1

    .line 1447
    check-cast v1, Lc1/b;

    .line 1448
    .line 1449
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1450
    .line 1451
    invoke-virtual {v1}, Lc1/b;->a()I

    .line 1452
    .line 1453
    .line 1454
    move-result v3

    .line 1455
    aput v3, v2, v14

    .line 1456
    .line 1457
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1458
    .line 1459
    invoke-virtual {v1}, Lc1/b;->b()I

    .line 1460
    .line 1461
    .line 1462
    move-result v1

    .line 1463
    aput v1, v2, v5

    .line 1464
    .line 1465
    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 1466
    .line 1467
    .line 1468
    move-result-object v1

    .line 1469
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 1470
    .line 1471
    .line 1472
    move-result-object v1

    .line 1473
    check-cast v1, Lcom/android/launcher3/CellLayout;

    .line 1474
    .line 1475
    invoke-virtual {v1, v6}, Lcom/android/launcher3/CellLayout;->f0(Landroid/view/View;)V

    .line 1476
    .line 1477
    .line 1478
    :cond_2c
    move-object/from16 v44, v4

    .line 1479
    .line 1480
    move-object v12, v6

    .line 1481
    move v13, v14

    .line 1482
    const/16 v32, 0x0

    .line 1483
    .line 1484
    goto/16 :goto_1c

    .line 1485
    .line 1486
    :cond_2d
    const/4 v5, 0x1

    .line 1487
    invoke-virtual/range {v24 .. v24}, Lf1/a$a;->c()Z

    .line 1488
    .line 1489
    .line 1490
    move-result v1

    .line 1491
    if-eqz v1, :cond_2c

    .line 1492
    .line 1493
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 1494
    .line 1495
    invoke-virtual {v1, v5}, Lp1/a;->n(Z)V

    .line 1496
    .line 1497
    .line 1498
    invoke-virtual/range {v34 .. v34}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 1499
    .line 1500
    .line 1501
    move-result-object v1

    .line 1502
    move-object v10, v1

    .line 1503
    check-cast v10, Lcom/android/launcher3/model/data/y;

    .line 1504
    .line 1505
    move-object/from16 v12, v34

    .line 1506
    .line 1507
    invoke-virtual {v0, v12}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 1508
    .line 1509
    .line 1510
    move-result-object v1

    .line 1511
    if-eqz v1, :cond_2e

    .line 1512
    .line 1513
    invoke-virtual {v1, v12}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 1514
    .line 1515
    .line 1516
    :cond_2e
    invoke-virtual {v0, v6}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 1517
    .line 1518
    .line 1519
    move-result-object v1

    .line 1520
    if-eqz v1, :cond_2f

    .line 1521
    .line 1522
    invoke-virtual {v1, v6}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 1523
    .line 1524
    .line 1525
    :cond_2f
    move-object/from16 v18, v4

    .line 1526
    .line 1527
    aget v4, v27, v14

    .line 1528
    .line 1529
    const/16 v35, 0x1

    .line 1530
    .line 1531
    aget v5, v27, v35

    .line 1532
    .line 1533
    move-object v1, v6

    .line 1534
    iget v6, v15, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1535
    .line 1536
    iget v7, v15, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1537
    .line 1538
    move/from16 v16, v14

    .line 1539
    .line 1540
    move-object/from16 v44, v18

    .line 1541
    .line 1542
    move/from16 v14, v35

    .line 1543
    .line 1544
    const/16 v32, 0x0

    .line 1545
    .line 1546
    invoke-interface/range {v0 .. v7}, Lcom/android/launcher3/M6;->q(Landroid/view/View;IIIIII)V

    .line 1547
    .line 1548
    .line 1549
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 1550
    .line 1551
    .line 1552
    move-result-object v4

    .line 1553
    check-cast v4, Lc1/b;

    .line 1554
    .line 1555
    aget v5, v27, v16

    .line 1556
    .line 1557
    invoke-virtual {v4, v5}, Lc1/b;->h(I)V

    .line 1558
    .line 1559
    .line 1560
    aget v5, v27, v16

    .line 1561
    .line 1562
    invoke-virtual {v4, v5}, Lc1/b;->e(I)V

    .line 1563
    .line 1564
    .line 1565
    aget v5, v27, v14

    .line 1566
    .line 1567
    invoke-virtual {v4, v5}, Lc1/b;->i(I)V

    .line 1568
    .line 1569
    .line 1570
    aget v5, v27, v14

    .line 1571
    .line 1572
    invoke-virtual {v4, v5}, Lc1/b;->g(I)V

    .line 1573
    .line 1574
    .line 1575
    iget v5, v15, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1576
    .line 1577
    iput v5, v4, Lc1/b;->f:I

    .line 1578
    .line 1579
    iget v5, v15, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1580
    .line 1581
    iput v5, v4, Lc1/b;->g:I

    .line 1582
    .line 1583
    iput-boolean v14, v4, Lc1/b;->h:Z

    .line 1584
    .line 1585
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1586
    .line 1587
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 1588
    .line 1589
    .line 1590
    move-result-object v24

    .line 1591
    aget v28, v27, v16

    .line 1592
    .line 1593
    aget v29, v27, v14

    .line 1594
    .line 1595
    iget v4, v15, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1596
    .line 1597
    iget v5, v15, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1598
    .line 1599
    move/from16 v26, v2

    .line 1600
    .line 1601
    move/from16 v27, v3

    .line 1602
    .line 1603
    move/from16 v30, v4

    .line 1604
    .line 1605
    move/from16 v31, v5

    .line 1606
    .line 1607
    move-object/from16 v25, v15

    .line 1608
    .line 1609
    invoke-virtual/range {v24 .. v31}, Lz1/J3;->R(Lcom/android/launcher3/model/data/y;IIIIII)V

    .line 1610
    .line 1611
    .line 1612
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1613
    .line 1614
    iget v2, v2, Lc1/a;->f:I

    .line 1615
    .line 1616
    invoke-virtual {v0, v2}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 1617
    .line 1618
    .line 1619
    move-result-object v2

    .line 1620
    if-nez v2, :cond_30

    .line 1621
    .line 1622
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1623
    .line 1624
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1625
    .line 1626
    .line 1627
    const-string v3, "screenId "

    .line 1628
    .line 1629
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1630
    .line 1631
    .line 1632
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1633
    .line 1634
    iget v3, v3, Lc1/a;->f:I

    .line 1635
    .line 1636
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1637
    .line 1638
    .line 1639
    const-string v3, " not found, remove hotseat icon and add to workspace"

    .line 1640
    .line 1641
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1642
    .line 1643
    .line 1644
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1645
    .line 1646
    .line 1647
    move-result-object v2

    .line 1648
    invoke-static {v13, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1649
    .line 1650
    .line 1651
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1652
    .line 1653
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1654
    .line 1655
    .line 1656
    move-result-object v2

    .line 1657
    new-instance v3, Ljava/util/ArrayList;

    .line 1658
    .line 1659
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1660
    .line 1661
    .line 1662
    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1663
    .line 1664
    .line 1665
    invoke-virtual {v0, v10}, Lcom/android/launcher3/Workspace;->n1(Ljava/lang/Object;)Landroid/view/View;

    .line 1666
    .line 1667
    .line 1668
    move-result-object v4

    .line 1669
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1670
    .line 1671
    const/4 v14, 0x1

    .line 1672
    invoke-virtual {v5, v4, v10, v14}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 1673
    .line 1674
    .line 1675
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 1676
    .line 1677
    .line 1678
    move-result-object v2

    .line 1679
    new-instance v4, Lx1/O$b;

    .line 1680
    .line 1681
    invoke-direct {v4, v3}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    .line 1682
    .line 1683
    .line 1684
    invoke-virtual {v4}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 1685
    .line 1686
    .line 1687
    move-result-object v3

    .line 1688
    invoke-virtual {v2, v3}, Lcom/android/launcher3/D3;->L(Ljava/util/List;)V

    .line 1689
    .line 1690
    .line 1691
    move-object v12, v1

    .line 1692
    move/from16 v13, v16

    .line 1693
    .line 1694
    goto :goto_1b

    .line 1695
    :cond_30
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1696
    .line 1697
    iget v3, v2, Lc1/a;->f:I

    .line 1698
    .line 1699
    iget v4, v2, Lcom/android/launcher3/util/C;->a:I

    .line 1700
    .line 1701
    iget v5, v2, Lcom/android/launcher3/util/C;->b:I

    .line 1702
    .line 1703
    iget v6, v10, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1704
    .line 1705
    iget v7, v10, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1706
    .line 1707
    const/16 v2, -0x64

    .line 1708
    .line 1709
    move-object/from16 v45, v12

    .line 1710
    .line 1711
    move-object v12, v1

    .line 1712
    move-object/from16 v1, v45

    .line 1713
    .line 1714
    invoke-interface/range {v0 .. v7}, Lcom/android/launcher3/M6;->q(Landroid/view/View;IIIIII)V

    .line 1715
    .line 1716
    .line 1717
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 1718
    .line 1719
    .line 1720
    move-result-object v2

    .line 1721
    check-cast v2, Lc1/b;

    .line 1722
    .line 1723
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1724
    .line 1725
    iget v3, v3, Lcom/android/launcher3/util/C;->a:I

    .line 1726
    .line 1727
    invoke-virtual {v2, v3}, Lc1/b;->h(I)V

    .line 1728
    .line 1729
    .line 1730
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1731
    .line 1732
    iget v3, v3, Lcom/android/launcher3/util/C;->a:I

    .line 1733
    .line 1734
    invoke-virtual {v2, v3}, Lc1/b;->e(I)V

    .line 1735
    .line 1736
    .line 1737
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1738
    .line 1739
    iget v3, v3, Lcom/android/launcher3/util/C;->b:I

    .line 1740
    .line 1741
    invoke-virtual {v2, v3}, Lc1/b;->i(I)V

    .line 1742
    .line 1743
    .line 1744
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1745
    .line 1746
    iget v3, v3, Lcom/android/launcher3/util/C;->b:I

    .line 1747
    .line 1748
    invoke-virtual {v2, v3}, Lc1/b;->g(I)V

    .line 1749
    .line 1750
    .line 1751
    iget v3, v10, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1752
    .line 1753
    iput v3, v2, Lc1/b;->f:I

    .line 1754
    .line 1755
    iget v3, v10, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1756
    .line 1757
    iput v3, v2, Lc1/b;->g:I

    .line 1758
    .line 1759
    const/4 v5, 0x1

    .line 1760
    iput-boolean v5, v2, Lc1/b;->h:Z

    .line 1761
    .line 1762
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1763
    .line 1764
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 1765
    .line 1766
    .line 1767
    move-result-object v36

    .line 1768
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->q:Lc1/a;

    .line 1769
    .line 1770
    iget v3, v2, Lc1/a;->f:I

    .line 1771
    .line 1772
    iget v4, v2, Lcom/android/launcher3/util/C;->a:I

    .line 1773
    .line 1774
    iget v2, v2, Lcom/android/launcher3/util/C;->b:I

    .line 1775
    .line 1776
    iget v5, v10, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 1777
    .line 1778
    iget v6, v10, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 1779
    .line 1780
    const/16 v38, -0x64

    .line 1781
    .line 1782
    move/from16 v41, v2

    .line 1783
    .line 1784
    move/from16 v39, v3

    .line 1785
    .line 1786
    move/from16 v40, v4

    .line 1787
    .line 1788
    move/from16 v42, v5

    .line 1789
    .line 1790
    move/from16 v43, v6

    .line 1791
    .line 1792
    move-object/from16 v37, v10

    .line 1793
    .line 1794
    invoke-virtual/range {v36 .. v43}, Lz1/J3;->R(Lcom/android/launcher3/model/data/y;IIIIII)V

    .line 1795
    .line 1796
    .line 1797
    move/from16 v13, v16

    .line 1798
    .line 1799
    invoke-virtual {v1, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1800
    .line 1801
    .line 1802
    :goto_1b
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1803
    .line 1804
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 1805
    .line 1806
    .line 1807
    move-result-object v1

    .line 1808
    invoke-virtual {v1}, Lcom/android/launcher3/Hotseat;->Z0()V

    .line 1809
    .line 1810
    .line 1811
    :goto_1c
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 1812
    .line 1813
    .line 1814
    move-result-object v1

    .line 1815
    check-cast v1, Lc1/b;

    .line 1816
    .line 1817
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1818
    .line 1819
    invoke-virtual {v1}, Lc1/b;->a()I

    .line 1820
    .line 1821
    .line 1822
    move-result v3

    .line 1823
    aput v3, v2, v13

    .line 1824
    .line 1825
    iget-object v2, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 1826
    .line 1827
    invoke-virtual {v1}, Lc1/b;->b()I

    .line 1828
    .line 1829
    .line 1830
    move-result v1

    .line 1831
    const/16 v35, 0x1

    .line 1832
    .line 1833
    aput v1, v2, v35

    .line 1834
    .line 1835
    invoke-virtual {v12}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 1836
    .line 1837
    .line 1838
    move-result-object v1

    .line 1839
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 1840
    .line 1841
    .line 1842
    move-result-object v1

    .line 1843
    check-cast v1, Lcom/android/launcher3/CellLayout;

    .line 1844
    .line 1845
    invoke-virtual {v1, v12}, Lcom/android/launcher3/CellLayout;->f0(Landroid/view/View;)V

    .line 1846
    .line 1847
    .line 1848
    move-object/from16 v1, v32

    .line 1849
    .line 1850
    const/4 v10, 0x0

    .line 1851
    :goto_1d
    move v13, v8

    .line 1852
    move-object v8, v1

    .line 1853
    move v1, v10

    .line 1854
    move/from16 v10, v17

    .line 1855
    .line 1856
    goto :goto_21

    .line 1857
    :cond_31
    :goto_1e
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1858
    .line 1859
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 1860
    .line 1861
    .line 1862
    move-result-object v1

    .line 1863
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->q()Z

    .line 1864
    .line 1865
    .line 1866
    move-result v1

    .line 1867
    if-eqz v1, :cond_32

    .line 1868
    .line 1869
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1870
    .line 1871
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 1872
    .line 1873
    .line 1874
    move-result-object v1

    .line 1875
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 1876
    .line 1877
    .line 1878
    move-result-object v1

    .line 1879
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1880
    .line 1881
    .line 1882
    move-result-object v1

    .line 1883
    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 1884
    .line 1885
    .line 1886
    move-result v2

    .line 1887
    if-eqz v2, :cond_32

    .line 1888
    .line 1889
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1890
    .line 1891
    .line 1892
    move-result-object v2

    .line 1893
    check-cast v2, Landroid/view/View;

    .line 1894
    .line 1895
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1896
    .line 1897
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 1898
    .line 1899
    .line 1900
    move-result-object v3

    .line 1901
    invoke-virtual {v3, v2}, Lcom/android/launcher3/Workspace;->K2(Landroid/view/View;)V

    .line 1902
    .line 1903
    .line 1904
    goto :goto_1f

    .line 1905
    :cond_32
    return-void

    .line 1906
    :cond_33
    move-object/from16 v13, p2

    .line 1907
    .line 1908
    move-object/from16 v44, v2

    .line 1909
    .line 1910
    move-object v11, v7

    .line 1911
    move/from16 v33, v15

    .line 1912
    .line 1913
    const/16 v32, 0x0

    .line 1914
    .line 1915
    instance-of v1, v12, Lcom/android/launcher3/widget/T;

    .line 1916
    .line 1917
    if-eqz v1, :cond_34

    .line 1918
    .line 1919
    iget-object v1, v11, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 1920
    .line 1921
    const/4 v5, 0x1

    .line 1922
    invoke-virtual {v1, v5}, Lcom/android/launcher3/dragndrop/v;->r(Z)V

    .line 1923
    .line 1924
    .line 1925
    invoke-virtual {v0, v12}, Lcom/android/launcher3/Workspace;->i1(Landroid/view/View;)Lcom/android/launcher3/CellLayout;

    .line 1926
    .line 1927
    .line 1928
    move-result-object v1

    .line 1929
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->isVisible(Landroid/view/View;)Z

    .line 1930
    .line 1931
    .line 1932
    move-result v2

    .line 1933
    if-eqz v2, :cond_34

    .line 1934
    .line 1935
    move-object v2, v12

    .line 1936
    check-cast v2, Lcom/android/launcher3/widget/T;

    .line 1937
    .line 1938
    iget-object v3, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 1939
    .line 1940
    invoke-direct {v0, v13, v2, v1, v3}, Lcom/android/launcher3/Workspace;->q1(Lcom/android/launcher3/dragndrop/p;Lcom/android/launcher3/widget/T;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/model/data/y;)Ljava/lang/Runnable;

    .line 1941
    .line 1942
    .line 1943
    move-result-object v1

    .line 1944
    move-object v8, v1

    .line 1945
    :goto_20
    const/4 v1, 0x0

    .line 1946
    const/4 v9, 0x0

    .line 1947
    const/4 v10, 0x0

    .line 1948
    const/4 v13, 0x0

    .line 1949
    goto :goto_21

    .line 1950
    :cond_34
    move-object/from16 v8, v32

    .line 1951
    .line 1952
    goto :goto_20

    .line 1953
    :goto_21
    invoke-virtual {v12}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 1954
    .line 1955
    .line 1956
    move-result-object v2

    .line 1957
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 1958
    .line 1959
    .line 1960
    move-result-object v2

    .line 1961
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 1962
    .line 1963
    iget-object v3, v11, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 1964
    .line 1965
    invoke-virtual {v3}, Lcom/android/launcher3/dragndrop/v;->u()Z

    .line 1966
    .line 1967
    .line 1968
    move-result v3

    .line 1969
    if-eqz v3, :cond_41

    .line 1970
    .line 1971
    if-eqz v10, :cond_39

    .line 1972
    .line 1973
    new-instance v1, Lcom/android/launcher3/util/Y1;

    .line 1974
    .line 1975
    invoke-direct {v1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 1976
    .line 1977
    .line 1978
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1979
    .line 1980
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 1981
    .line 1982
    .line 1983
    move-result-object v3

    .line 1984
    invoke-virtual {v3}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 1985
    .line 1986
    .line 1987
    move-result-object v3

    .line 1988
    check-cast v3, Lcom/android/launcher3/V3;

    .line 1989
    .line 1990
    iget-object v4, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 1991
    .line 1992
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 1993
    .line 1994
    .line 1995
    move-result-object v4

    .line 1996
    new-instance v5, Lcom/android/launcher3/t;

    .line 1997
    .line 1998
    invoke-direct {v5, v1}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 1999
    .line 2000
    .line 2001
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2002
    .line 2003
    const/4 v14, 0x1

    .line 2004
    invoke-interface {v3, v6, v14}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 2005
    .line 2006
    .line 2007
    move-result v3

    .line 2008
    invoke-virtual {v4, v5, v12, v3}, Lcom/android/launcher3/dragndrop/j;->i(Ljava/lang/Runnable;Landroid/view/View;I)V

    .line 2009
    .line 2010
    .line 2011
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2012
    .line 2013
    sget-object v4, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 2014
    .line 2015
    invoke-interface {v3, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 2016
    .line 2017
    .line 2018
    move-result v3

    .line 2019
    if-nez v3, :cond_37

    .line 2020
    .line 2021
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2022
    .line 2023
    sget-object v4, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 2024
    .line 2025
    invoke-interface {v3, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 2026
    .line 2027
    .line 2028
    move-result v3

    .line 2029
    if-nez v3, :cond_35

    .line 2030
    .line 2031
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2032
    .line 2033
    sget-object v4, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 2034
    .line 2035
    invoke-interface {v3, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 2036
    .line 2037
    .line 2038
    move-result v3

    .line 2039
    if-eqz v3, :cond_37

    .line 2040
    .line 2041
    :cond_35
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2042
    .line 2043
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2044
    .line 2045
    .line 2046
    move-result-object v3

    .line 2047
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2048
    .line 2049
    if-nez v8, :cond_36

    .line 2050
    .line 2051
    move-object/from16 v1, v32

    .line 2052
    .line 2053
    goto :goto_22

    .line 2054
    :cond_36
    new-instance v5, Lcom/android/launcher3/h6;

    .line 2055
    .line 2056
    invoke-direct {v5, v1, v8}, Lcom/android/launcher3/h6;-><init>(Lcom/android/launcher3/util/Y1;Ljava/lang/Runnable;)V

    .line 2057
    .line 2058
    .line 2059
    invoke-static {v5}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 2060
    .line 2061
    .line 2062
    move-result-object v1

    .line 2063
    :goto_22
    const-wide/16 v5, 0x0

    .line 2064
    .line 2065
    invoke-virtual {v3, v4, v5, v6, v1}, Lcom/android/launcher3/statemanager/d;->J(Lcom/android/launcher3/statemanager/a;JLandroid/animation/Animator$AnimatorListener;)V

    .line 2066
    .line 2067
    .line 2068
    goto :goto_23

    .line 2069
    :cond_37
    if-eqz v8, :cond_38

    .line 2070
    .line 2071
    new-instance v3, Lcom/android/launcher3/i6;

    .line 2072
    .line 2073
    invoke-direct {v3, v1, v8}, Lcom/android/launcher3/i6;-><init>(Lcom/android/launcher3/util/Y1;Ljava/lang/Runnable;)V

    .line 2074
    .line 2075
    .line 2076
    invoke-static {v3}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 2077
    .line 2078
    .line 2079
    :cond_38
    :goto_23
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2080
    .line 2081
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R1()Lcom/android/launcher3/DropTargetBar;

    .line 2082
    .line 2083
    .line 2084
    move-result-object v0

    .line 2085
    invoke-virtual {v0}, Lcom/android/launcher3/DropTargetBar;->v()V

    .line 2086
    .line 2087
    .line 2088
    invoke-virtual {v2, v12}, Lcom/android/launcher3/CellLayout;->l0(Landroid/view/View;)V

    .line 2089
    .line 2090
    .line 2091
    return-void

    .line 2092
    :cond_39
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2093
    .line 2094
    .line 2095
    move-result-object v3

    .line 2096
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 2097
    .line 2098
    iget v4, v3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2099
    .line 2100
    const/4 v5, 0x4

    .line 2101
    if-eq v4, v5, :cond_3a

    .line 2102
    .line 2103
    const/4 v5, 0x5

    .line 2104
    if-ne v4, v5, :cond_3b

    .line 2105
    .line 2106
    :cond_3a
    move-object/from16 v5, v44

    .line 2107
    .line 2108
    goto :goto_24

    .line 2109
    :cond_3b
    move-object/from16 v5, v44

    .line 2110
    .line 2111
    :cond_3c
    move-object v6, v12

    .line 2112
    goto :goto_27

    .line 2113
    :goto_24
    if-eqz v5, :cond_3c

    .line 2114
    .line 2115
    if-eqz v9, :cond_3d

    .line 2116
    .line 2117
    move/from16 v5, v33

    .line 2118
    .line 2119
    :goto_25
    move-object v1, v3

    .line 2120
    goto :goto_26

    .line 2121
    :cond_3d
    const/4 v5, 0x0

    .line 2122
    goto :goto_25

    .line 2123
    :goto_26
    iget-object v3, v11, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 2124
    .line 2125
    const/4 v4, 0x0

    .line 2126
    const/4 v7, 0x0

    .line 2127
    move-object v6, v12

    .line 2128
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/Workspace;->D0(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/v;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 2129
    .line 2130
    .line 2131
    goto :goto_28

    .line 2132
    :goto_27
    sget-object v3, Lf1/a;->x:Lf1/a$a;

    .line 2133
    .line 2134
    invoke-virtual {v3}, Lf1/a$a;->c()Z

    .line 2135
    .line 2136
    .line 2137
    move-result v3

    .line 2138
    if-eqz v3, :cond_3e

    .line 2139
    .line 2140
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 2141
    .line 2142
    invoke-virtual {v3, v5, v6}, Lp1/a;->j(Lcom/android/launcher3/CellLayout;Landroid/view/View;)V

    .line 2143
    .line 2144
    .line 2145
    :cond_3e
    if-eqz v1, :cond_3f

    .line 2146
    .line 2147
    const/16 v20, 0x12c

    .line 2148
    .line 2149
    :cond_3f
    invoke-static {}, Lx1/O;->C3()Z

    .line 2150
    .line 2151
    .line 2152
    move-result v1

    .line 2153
    if-eqz v1, :cond_40

    .line 2154
    .line 2155
    instance-of v1, v5, Lcom/android/launcher3/Hotseat;

    .line 2156
    .line 2157
    if-eqz v1, :cond_40

    .line 2158
    .line 2159
    const/16 v20, 0x96

    .line 2160
    .line 2161
    :cond_40
    move/from16 v1, v20

    .line 2162
    .line 2163
    iget-object v3, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2164
    .line 2165
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 2166
    .line 2167
    .line 2168
    move-result-object v3

    .line 2169
    iget-object v4, v11, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 2170
    .line 2171
    invoke-virtual {v3, v4, v6, v1, v0}, Lcom/android/launcher3/dragndrop/DragLayer;->h(Lcom/android/launcher3/dragndrop/v;Landroid/view/View;ILandroid/view/View;)V

    .line 2172
    .line 2173
    .line 2174
    goto :goto_28

    .line 2175
    :cond_41
    move-object v6, v12

    .line 2176
    move-object/from16 v5, v44

    .line 2177
    .line 2178
    sget-object v1, Lf1/a;->x:Lf1/a$a;

    .line 2179
    .line 2180
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 2181
    .line 2182
    .line 2183
    move-result v1

    .line 2184
    if-eqz v1, :cond_42

    .line 2185
    .line 2186
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 2187
    .line 2188
    invoke-virtual {v1, v5, v6}, Lp1/a;->j(Lcom/android/launcher3/CellLayout;Landroid/view/View;)V

    .line 2189
    .line 2190
    .line 2191
    :cond_42
    const/4 v14, 0x0

    .line 2192
    iput-boolean v14, v11, Lcom/android/launcher3/n0$a;->k:Z

    .line 2193
    .line 2194
    invoke-virtual {v6, v14}, Landroid/view/View;->setVisibility(I)V

    .line 2195
    .line 2196
    .line 2197
    :goto_28
    invoke-virtual {v2, v6}, Lcom/android/launcher3/CellLayout;->l0(Landroid/view/View;)V

    .line 2198
    .line 2199
    .line 2200
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2201
    .line 2202
    sget-object v2, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 2203
    .line 2204
    invoke-interface {v1, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 2205
    .line 2206
    .line 2207
    move-result v1

    .line 2208
    if-nez v1, :cond_45

    .line 2209
    .line 2210
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2211
    .line 2212
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 2213
    .line 2214
    invoke-interface {v1, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 2215
    .line 2216
    .line 2217
    move-result v1

    .line 2218
    if-nez v1, :cond_43

    .line 2219
    .line 2220
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2221
    .line 2222
    sget-object v2, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 2223
    .line 2224
    invoke-interface {v1, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 2225
    .line 2226
    .line 2227
    move-result v1

    .line 2228
    if-eqz v1, :cond_45

    .line 2229
    .line 2230
    :cond_43
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 2231
    .line 2232
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2233
    .line 2234
    .line 2235
    move-result-object v1

    .line 2236
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2237
    .line 2238
    if-nez v8, :cond_44

    .line 2239
    .line 2240
    move-object/from16 v3, v32

    .line 2241
    .line 2242
    goto :goto_29

    .line 2243
    :cond_44
    invoke-static {v8}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 2244
    .line 2245
    .line 2246
    move-result-object v3

    .line 2247
    :goto_29
    const-wide/16 v4, 0x1f4

    .line 2248
    .line 2249
    invoke-virtual {v1, v2, v4, v5, v3}, Lcom/android/launcher3/statemanager/d;->J(Lcom/android/launcher3/statemanager/a;JLandroid/animation/Animator$AnimatorListener;)V

    .line 2250
    .line 2251
    .line 2252
    goto :goto_2a

    .line 2253
    :cond_45
    if-eqz v8, :cond_46

    .line 2254
    .line 2255
    invoke-interface {v8}, Ljava/lang/Runnable;->run()V

    .line 2256
    .line 2257
    .line 2258
    :cond_46
    :goto_2a
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->k0:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2259
    .line 2260
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 2261
    .line 2262
    .line 2263
    move-result-object v1

    .line 2264
    iget-object v2, v11, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 2265
    .line 2266
    invoke-interface {v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 2267
    .line 2268
    .line 2269
    move-result-object v1

    .line 2270
    iget-object v2, v11, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 2271
    .line 2272
    invoke-interface {v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 2273
    .line 2274
    .line 2275
    move-result-object v1

    .line 2276
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->p:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 2277
    .line 2278
    invoke-interface {v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 2279
    .line 2280
    .line 2281
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->n0:Lcom/android/launcher3/dragndrop/j$b;

    .line 2282
    .line 2283
    if-eqz v1, :cond_47

    .line 2284
    .line 2285
    const/16 v1, 0x40

    .line 2286
    .line 2287
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2288
    .line 2289
    .line 2290
    move-result-object v1

    .line 2291
    const v2, 0x7f0b046e

    .line 2292
    .line 2293
    .line 2294
    invoke-virtual {v6, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 2295
    .line 2296
    .line 2297
    :cond_47
    move v10, v13

    .line 2298
    goto :goto_2c

    .line 2299
    :goto_2b
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 2300
    .line 2301
    const/16 v16, 0x0

    .line 2302
    .line 2303
    aget v2, v1, v16

    .line 2304
    .line 2305
    float-to-int v2, v2

    .line 2306
    const/16 v35, 0x1

    .line 2307
    .line 2308
    aget v1, v1, v35

    .line 2309
    .line 2310
    float-to-int v1, v1

    .line 2311
    filled-new-array {v2, v1}, [I

    .line 2312
    .line 2313
    .line 2314
    move-result-object v1

    .line 2315
    invoke-direct {v0, v1, v5, v11}, Lcom/android/launcher3/Workspace;->u2([ILcom/android/launcher3/CellLayout;Lcom/android/launcher3/n0$a;)V

    .line 2316
    .line 2317
    .line 2318
    const/4 v10, 0x0

    .line 2319
    :goto_2c
    iget-object v1, v11, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 2320
    .line 2321
    if-eqz v1, :cond_48

    .line 2322
    .line 2323
    if-nez v10, :cond_48

    .line 2324
    .line 2325
    const v2, 0x7f140219

    .line 2326
    .line 2327
    .line 2328
    invoke-virtual {v1, v2}, LO0/e;->c(I)V

    .line 2329
    .line 2330
    .line 2331
    :cond_48
    sget-object v1, Lf1/a;->x:Lf1/a$a;

    .line 2332
    .line 2333
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 2334
    .line 2335
    .line 2336
    move-result v1

    .line 2337
    if-eqz v1, :cond_49

    .line 2338
    .line 2339
    iget-object v1, v0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 2340
    .line 2341
    invoke-virtual {v1}, Lp1/a;->p()V

    .line 2342
    .line 2343
    .line 2344
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->p0:Lp1/a;

    .line 2345
    .line 2346
    const/4 v13, 0x0

    .line 2347
    invoke-virtual {v0, v11, v13}, Lp1/a;->g(Lcom/android/launcher3/n0$a;Z)V

    .line 2348
    .line 2349
    .line 2350
    :cond_49
    sget-object v0, Li1/a$a;->h:Li1/a$a;

    .line 2351
    .line 2352
    invoke-static {v0}, Li1/a;->a(Li1/a$a;)V

    .line 2353
    .line 2354
    .line 2355
    return-void
.end method

.method public z1()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/Workspace;->D0:F

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget p0, p0, Lcom/android/launcher3/Workspace;->D0:F

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    cmpg-float p0, p0, v0

    .line 21
    .line 22
    if-gez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public z2(Landroid/view/MotionEvent;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace;->z:[I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    aget v3, v0, v2

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    float-to-int v4, v4

    .line 18
    add-int/2addr v3, v4

    .line 19
    aput v3, v0, v2

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    aget v4, v0, v3

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    float-to-int v1, v1

    .line 29
    add-int/2addr v4, v1

    .line 30
    aput v4, v0, v3

    .line 31
    .line 32
    iget-object v5, p0, Lcom/android/launcher3/Workspace;->l:Landroid/app/WallpaperManager;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-ne p0, v3, :cond_0

    .line 43
    .line 44
    const-string p0, "android.wallpaper.tap"

    .line 45
    .line 46
    :goto_0
    move-object v7, p0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    const-string p0, "android.wallpaper.secondaryTap"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :goto_1
    aget v8, v0, v2

    .line 52
    .line 53
    aget v9, v0, v3

    .line 54
    .line 55
    const/4 v10, 0x0

    .line 56
    const/4 v11, 0x0

    .line 57
    invoke-virtual/range {v5 .. v11}, Landroid/app/WallpaperManager;->sendWallpaperCommand(Landroid/os/IBinder;Ljava/lang/String;IIILandroid/os/Bundle;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public z3(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/B6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/B6;-><init>(Lcom/android/launcher3/Workspace;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/Folder;->w1(Lcom/android/launcher3/util/Y0$a;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
