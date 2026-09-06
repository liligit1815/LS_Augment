.class public Lcom/android/quickstep/views/LaunchableConstraintLayout;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "LaunchableConstraintLayout.kt"

# interfaces
.implements Lu2/j;


# instance fields
.field private final delegate:Lu2/k;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Lu2/k;

    .line 3
    new-instance v0, Lcom/android/quickstep/views/t;

    invoke-direct {v0, p0}, Lcom/android/quickstep/views/t;-><init>(Lcom/android/quickstep/views/LaunchableConstraintLayout;)V

    .line 4
    invoke-direct {p1, p0, v0}, Lu2/k;-><init>(Landroid/view/View;Lu4/l;)V

    iput-object p1, p0, Lcom/android/quickstep/views/LaunchableConstraintLayout;->delegate:Lu2/k;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 6
    new-instance p1, Lu2/k;

    .line 7
    new-instance p2, Lcom/android/quickstep/views/t;

    invoke-direct {p2, p0}, Lcom/android/quickstep/views/t;-><init>(Lcom/android/quickstep/views/LaunchableConstraintLayout;)V

    .line 8
    invoke-direct {p1, p0, p2}, Lu2/k;-><init>(Landroid/view/View;Lu4/l;)V

    iput-object p1, p0, Lcom/android/quickstep/views/LaunchableConstraintLayout;->delegate:Lu2/k;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 10
    new-instance p1, Lu2/k;

    .line 11
    new-instance p2, Lcom/android/quickstep/views/t;

    invoke-direct {p2, p0}, Lcom/android/quickstep/views/t;-><init>(Lcom/android/quickstep/views/LaunchableConstraintLayout;)V

    .line 12
    invoke-direct {p1, p0, p2}, Lu2/k;-><init>(Landroid/view/View;Lu4/l;)V

    iput-object p1, p0, Lcom/android/quickstep/views/LaunchableConstraintLayout;->delegate:Lu2/k;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 14
    new-instance p1, Lu2/k;

    .line 15
    new-instance p2, Lcom/android/quickstep/views/t;

    invoke-direct {p2, p0}, Lcom/android/quickstep/views/t;-><init>(Lcom/android/quickstep/views/LaunchableConstraintLayout;)V

    .line 16
    invoke-direct {p1, p0, p2}, Lu2/k;-><init>(Landroid/view/View;Lu4/l;)V

    iput-object p1, p0, Lcom/android/quickstep/views/LaunchableConstraintLayout;->delegate:Lu2/k;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/LaunchableConstraintLayout;I)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/LaunchableConstraintLayout;->delegate$lambda$0(Lcom/android/quickstep/views/LaunchableConstraintLayout;I)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final delegate$lambda$0(Lcom/android/quickstep/views/LaunchableConstraintLayout;I)Lh4/t;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
.end method


# virtual methods
.method public bridge synthetic getPaddingForLaunchAnimation()Landroid/graphics/Rect;
    .locals 0

    .line 1
    invoke-super {p0}, Lu2/j;->getPaddingForLaunchAnimation()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic onActivityLaunchAnimationEnd()V
    .locals 0

    .line 1
    invoke-super {p0}, Lu2/j;->onActivityLaunchAnimationEnd()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setShouldBlockVisibilityChanges(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/LaunchableConstraintLayout;->delegate:Lu2/k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lu2/k;->setShouldBlockVisibilityChanges(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVisibility(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/LaunchableConstraintLayout;->delegate:Lu2/k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lu2/k;->a(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
