.class public Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;
.super Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;
.source "Snackbar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar$SnackbarLayout;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar<",
        "Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;",
        ">;"
    }
.end annotation


# static fields
.field private static final y:[I

.field private static final z:[I


# instance fields
.field private final w:Landroid/view/accessibility/AccessibilityManager;

.field private x:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const v0, 0x7f040601

    .line 2
    .line 3
    .line 4
    filled-new-array {v0}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    sput-object v1, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->y:[I

    .line 9
    .line 10
    const v1, 0x7f040603

    .line 11
    .line 12
    .line 13
    filled-new-array {v0, v1}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->z:[I

    .line 18
    .line 19
    return-void
.end method

.method private constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;Lcom/android/launcher3/mfvUtil/customsnackbar/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Lcom/android/launcher3/mfvUtil/customsnackbar/a;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string p2, "accessibility"

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/view/accessibility/AccessibilityManager;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->w:Landroid/view/accessibility/AccessibilityManager;

    .line 17
    .line 18
    return-void
.end method

.method private static W(Landroid/view/View;)Landroid/view/ViewGroup;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move-object v1, v0

    .line 3
    :cond_0
    instance-of v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 4
    .line 5
    if-eqz v2, :cond_1

    .line 6
    .line 7
    check-cast p0, Landroid/view/ViewGroup;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_1
    instance-of v2, p0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    if-eqz v2, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const v2, 0x1020002

    .line 19
    .line 20
    .line 21
    if-ne v1, v2, :cond_2

    .line 22
    .line 23
    check-cast p0, Landroid/view/ViewGroup;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    move-object v1, p0

    .line 27
    check-cast v1, Landroid/view/ViewGroup;

    .line 28
    .line 29
    :cond_3
    if-eqz p0, :cond_5

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    instance-of v2, p0, Landroid/view/View;

    .line 36
    .line 37
    if-eqz v2, :cond_4

    .line 38
    .line 39
    check-cast p0, Landroid/view/View;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_4
    move-object p0, v0

    .line 43
    :cond_5
    :goto_0
    if-nez p0, :cond_0

    .line 44
    .line 45
    return-object v1
.end method

.method public static X(Landroid/view/View;II)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->Y(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static Y(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->W(Landroid/view/View;)Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const v1, 0x7f0e0095

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/android/launcher3/mfvUtil/customsnackbar/SnackbarContentLayout;

    .line 24
    .line 25
    new-instance v1, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 26
    .line 27
    invoke-direct {v1, p0, v0, v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Lcom/android/launcher3/mfvUtil/customsnackbar/a;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->b0(Ljava/lang/CharSequence;)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p2}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->K(I)Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 34
    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 38
    .line 39
    const-string p1, "No suitable parent found from the given view. Please provide a valid view."

    .line 40
    .line 41
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw p0
.end method


# virtual methods
.method public O()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z(ILandroid/view/View$OnClickListener;)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->v()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->a0(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public a0(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/mfvUtil/customsnackbar/SnackbarContentLayout;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/SnackbarContentLayout;->getActionView()Landroid/widget/TextView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v2, 0x1

    .line 24
    iput-boolean v2, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->x:Z

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const v1, 0x7f06059c

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar$a;

    .line 47
    .line 48
    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar$a;-><init>(Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_1
    :goto_0
    const/16 p1, 0x8

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 58
    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    iput-boolean v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->x:Z

    .line 65
    .line 66
    return-object p0
.end method

.method public b0(Ljava/lang/CharSequence;)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->c:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/mfvUtil/customsnackbar/SnackbarContentLayout;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/SnackbarContentLayout;->getMessageView()Landroid/widget/TextView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public s()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w()I
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->w()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->x:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v1, 0x0

    .line 16
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->w:Landroid/view/accessibility/AccessibilityManager;

    .line 17
    .line 18
    or-int/lit8 v1, v1, 0x3

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Landroid/view/accessibility/AccessibilityManager;->getRecommendedTimeoutMillis(II)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method
