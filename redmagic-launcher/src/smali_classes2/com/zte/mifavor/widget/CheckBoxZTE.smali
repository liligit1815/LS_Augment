.class public Lcom/zte/mifavor/widget/CheckBoxZTE;
.super Landroid/widget/CheckBox;
.source "CheckBoxZTE.java"


# static fields
.field private static g:Landroid/view/animation/Animation;

.field private static h:Landroid/view/animation/Animation;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/CheckBoxZTE;->a(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private a(Landroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/zte/mifavor/widget/CheckBoxZTE;->g:Landroid/view/animation/Animation;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    sget v0, LR3/a;->b:I

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/zte/mifavor/widget/CheckBoxZTE;->g:Landroid/view/animation/Animation;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    sget-object v0, Lcom/zte/mifavor/widget/CheckBoxZTE;->h:Landroid/view/animation/Animation;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    sget v0, LR3/a;->a:I

    .line 22
    .line 23
    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sput-object p1, Lcom/zte/mifavor/widget/CheckBoxZTE;->h:Landroid/view/animation/Animation;

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setVerticalScrollBarEnabled(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setHorizontalScrollBarEnabled(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public setVisibility(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setVisibilityEx(I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/zte/mifavor/widget/u;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    if-nez p1, :cond_1

    .line 12
    .line 13
    sget-object p1, Lcom/zte/mifavor/widget/CheckBoxZTE;->g:Landroid/view/animation/Animation;

    .line 14
    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/animation/Animation;->cancel()V

    .line 18
    .line 19
    .line 20
    sget-object p1, Lcom/zte/mifavor/widget/CheckBoxZTE;->g:Landroid/view/animation/Animation;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->startAnimation(Landroid/view/animation/Animation;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    sget-object p1, Lcom/zte/mifavor/widget/CheckBoxZTE;->h:Landroid/view/animation/Animation;

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/animation/Animation;->cancel()V

    .line 31
    .line 32
    .line 33
    sget-object p1, Lcom/zte/mifavor/widget/CheckBoxZTE;->h:Landroid/view/animation/Animation;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->startAnimation(Landroid/view/animation/Animation;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method
