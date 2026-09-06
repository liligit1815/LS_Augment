.class public Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;
.super Lcom/android/launcher3/ExtendedEditText;
.source "AppsSearchContainerLayout.java"

# interfaces
.implements Lcom/android/launcher3/allapps/p0;
.implements LI1/b;
.implements Lcom/android/launcher3/allapps/D$a;
.implements Lcom/android/launcher3/g1;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/ExtendedEditText;",
        "Lcom/android/launcher3/allapps/p0;",
        "LI1/b<",
        "Lcom/android/launcher3/allapps/O$a;",
        ">;",
        "Lcom/android/launcher3/allapps/D$a;",
        "Lcom/android/launcher3/g1;"
    }
.end annotation


# instance fields
.field private final j:Lcom/android/launcher3/views/k;

.field private final k:LP0/a;

.field private final l:Landroid/text/SpannableStringBuilder;

.field private m:Lcom/android/launcher3/allapps/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/r<",
            "*>;"
        }
    .end annotation
.end field

.field private final n:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/ExtendedEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/views/k;

    iput-object p1, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->j:Lcom/android/launcher3/views/k;

    .line 4
    new-instance p1, LP0/a;

    invoke-direct {p1}, LP0/a;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->k:LP0/a;

    .line 5
    new-instance p1, Landroid/text/SpannableStringBuilder;

    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->l:Landroid/text/SpannableStringBuilder;

    const/4 p2, 0x0

    .line 6
    invoke-static {p1, p2}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 7
    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0811e6

    invoke-virtual {p0}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/android/launcher3/N5;->S(Landroid/content/Context;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 8
    invoke-virtual {p0}, Landroid/widget/EditText;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0700ea

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->n:I

    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/allapps/r;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/allapps/r<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->m:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->k:LP0/a;

    .line 4
    .line 5
    new-instance v0, LP0/e;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-direct {v0, v1, v2}, LP0/e;-><init>(Landroid/content/Context;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->j:Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-virtual {p1, v0, p0, v1, p0}, LP0/a;->c(LI1/a;Lcom/android/launcher3/ExtendedEditText;Lcom/android/launcher3/views/k;LI1/b;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "onSearchResult size(may include empty item): "

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string v0, "items is null"

    .line 23
    .line 24
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "AppsSearchContainerLayout"

    .line 32
    .line 33
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->m:Lcom/android/launcher3/allapps/r;

    .line 39
    .line 40
    invoke-virtual {p0, p2}, Lcom/android/launcher3/allapps/r;->setSearchResults(Ljava/util/ArrayList;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->k:LP0/a;

    .line 2
    .line 3
    invoke-virtual {p0}, LP0/a;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    const-string v0, "AppsSearchContainerLayout"

    .line 2
    .line 3
    const-string v1, "clearSearchResult"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->l:Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->l:Landroid/text/SpannableStringBuilder;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->l:Landroid/text/SpannableStringBuilder;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->m:Lcom/android/launcher3/allapps/r;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->l0()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->k:LP0/a;

    .line 2
    .line 3
    invoke-virtual {p0}, LP0/a;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getBackgroundVisibility()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/allapps/p0;->getBackgroundVisibility()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getEditText()Lcom/android/launcher3/ExtendedEditText;
    .locals 0

    .line 1
    return-object p0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/EditText;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->m:Lcom/android/launcher3/allapps/r;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p0}, Lcom/android/launcher3/allapps/D;->h(Lcom/android/launcher3/allapps/D$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/EditText;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->m:Lcom/android/launcher3/allapps/r;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p0}, Lcom/android/launcher3/allapps/D;->v(Lcom/android/launcher3/allapps/D$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/EditText;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->X0()Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->X0()Z

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onMeasure(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public preDispatchKeyEvent(Landroid/view/KeyEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->k:LP0/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LP0/a;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(I)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Character;->isSpaceChar(I)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Landroid/text/method/TextKeyListener;->getInstance()Landroid/text/method/TextKeyListener;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->l:Landroid/text/SpannableStringBuilder;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {v0, p0, v1, v2, p1}, Landroid/text/method/TextKeyListener;->onKeyDown(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    iget-object p1, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->l:Landroid/text/SpannableStringBuilder;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-lez p1, :cond_0

    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->k:LP0/a;

    .line 58
    .line 59
    invoke-virtual {p0}, LP0/a;->b()V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 6
    .line 7
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 8
    .line 9
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/EditText;->requestLayout()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setMenuBtn(Landroid/widget/Button;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/search/AppsSearchContainerLayout;->k:LP0/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LP0/a;->g(Landroid/widget/Button;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
