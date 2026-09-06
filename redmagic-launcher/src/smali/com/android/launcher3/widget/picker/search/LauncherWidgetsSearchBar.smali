.class public Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;
.super Landroid/widget/LinearLayout;
.source "LauncherWidgetsSearchBar.java"

# interfaces
.implements Lcom/android/launcher3/widget/picker/search/b;


# instance fields
.field private g:Lp2/g;

.field private h:Lcom/android/launcher3/ExtendedEditText;

.field private i:Landroid/widget/ImageButton;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/widget/picker/search/b$a;Lp2/a;)V
    .locals 3

    .line 1
    new-instance v0, Lp2/g;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/picker/search/a;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Lcom/android/launcher3/widget/picker/search/a;-><init>(Lcom/android/launcher3/widget/picker/search/b$a;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;->h:Lcom/android/launcher3/ExtendedEditText;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;->i:Landroid/widget/ImageButton;

    .line 11
    .line 12
    invoke-direct {v0, v1, p1, v2, p2}, Lp2/g;-><init>(LI1/a;Lcom/android/launcher3/ExtendedEditText;Landroid/widget/ImageButton;Lp2/a;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;->g:Lp2/g;

    .line 16
    .line 17
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;->h:Lcom/android/launcher3/ExtendedEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->isFocused()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;->g:Lp2/g;

    .line 2
    .line 3
    invoke-virtual {p0}, Lp2/g;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;->g:Lp2/g;

    .line 5
    .line 6
    invoke-virtual {p0}, Lp2/g;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b06a3

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/ExtendedEditText;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;->h:Lcom/android/launcher3/ExtendedEditText;

    .line 14
    .line 15
    const v0, 0x7f0b06a4

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/ImageButton;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;->i:Landroid/widget/ImageButton;

    .line 25
    .line 26
    return-void
.end method

.method public reset()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/search/LauncherWidgetsSearchBar;->g:Lp2/g;

    .line 2
    .line 3
    invoke-virtual {p0}, Lp2/g;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
