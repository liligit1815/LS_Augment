.class public Landroidx/slice/widget/MessageView;
.super Landroidx/slice/widget/h;
.source "MessageView.java"


# instance fields
.field private o:Landroid/widget/TextView;

.field private p:Landroid/widget/ImageView;


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public getMode()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x1020010

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/TextView;

    .line 12
    .line 13
    iput-object v0, p0, Landroidx/slice/widget/MessageView;->o:Landroid/widget/TextView;

    .line 14
    .line 15
    const v0, 0x1020006

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/ImageView;

    .line 23
    .line 24
    iput-object v0, p0, Landroidx/slice/widget/MessageView;->p:Landroid/widget/ImageView;

    .line 25
    .line 26
    return-void
.end method
