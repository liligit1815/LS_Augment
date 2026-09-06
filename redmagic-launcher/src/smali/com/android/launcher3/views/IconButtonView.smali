.class public Lcom/android/launcher3/views/IconButtonView;
.super Lcom/android/launcher3/BubbleTextView;
.source "IconButtonView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/views/IconButtonView$a;
    }
.end annotation


# static fields
.field private static final A0:[I


# instance fields
.field private final z0:Lcom/android/launcher3/util/z1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const v0, 0x1010002

    .line 2
    .line 3
    .line 4
    filled-new-array {v0}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Lcom/android/launcher3/views/IconButtonView;->A0:[I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/IconButtonView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/BubbleTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance v0, Lcom/android/launcher3/util/z1;

    const/16 v1, 0x9

    const/16 v2, 0x8

    invoke-direct {v0, p0, v1, v2}, Lcom/android/launcher3/util/z1;-><init>(Landroid/view/View;II)V

    iput-object v0, p0, Lcom/android/launcher3/views/IconButtonView;->z0:Lcom/android/launcher3/util/z1;

    .line 4
    sget-object v0, Lcom/android/launcher3/views/IconButtonView;->A0:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 5
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 6
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 7
    invoke-virtual {p0}, Landroid/widget/TextView;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object p2

    if-nez p2, :cond_0

    const/4 p2, -0x1

    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p2

    :goto_0
    if-nez p3, :cond_1

    .line 9
    new-instance p3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p3, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 10
    :cond_1
    invoke-static {p1}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    move-result-object p1

    .line 11
    :try_start_0
    new-instance v0, Lcom/android/launcher3/views/IconButtonView$a;

    invoke-virtual {p1}, Ls1/b;->b0()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, v1, p2, p3}, Lcom/android/launcher3/views/IconButtonView$a;-><init>(Landroid/graphics/Bitmap;ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->setIcon(Ls1/o;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    invoke-virtual {p1}, Ls1/b;->close()V

    return-void

    :catchall_0
    move-exception p0

    if-eqz p1, :cond_2

    .line 13
    :try_start_1
    invoke-virtual {p1}, Ls1/b;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw p0
.end method


# virtual methods
.method public getTranslateDelegate()Lcom/android/launcher3/util/z1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/IconButtonView;->z0:Lcom/android/launcher3/util/z1;

    .line 2
    .line 3
    return-object p0
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Landroid/widget/TextView;->getContentDescription()Ljava/lang/CharSequence;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic setForceHideRing(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setForegroundTint(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/android/launcher3/views/IconButtonView$a;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/views/IconButtonView$a;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/views/IconButtonView$a;->v(Lcom/android/launcher3/views/IconButtonView$a;)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :try_start_0
    new-instance v2, Lcom/android/launcher3/views/IconButtonView$a;

    .line 22
    .line 23
    invoke-virtual {v1}, Ls1/b;->b0()Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-direct {v2, v3, v0, p1}, Lcom/android/launcher3/views/IconButtonView$a;-><init>(Landroid/graphics/Bitmap;ILandroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v2}, Lcom/android/launcher3/BubbleTextView;->setIcon(Ls1/o;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ls1/b;->close()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    :try_start_1
    invoke-virtual {v1}, Ls1/b;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :catchall_1
    move-exception p1

    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_1
    throw p0
.end method

.method public setTranslationXForTaskbarAllAppsIcon(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/IconButtonView;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
