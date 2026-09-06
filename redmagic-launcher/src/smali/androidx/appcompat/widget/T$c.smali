.class Landroidx/appcompat/widget/T$c;
.super Ljava/lang/Object;
.source "ScrollingTabContainerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/T;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field final synthetic g:Landroidx/appcompat/widget/T;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/T;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/T$c;->g:Landroidx/appcompat/widget/T;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/appcompat/widget/T$d;

    .line 3
    .line 4
    invoke-virtual {v0}, Landroidx/appcompat/widget/T$d;->b()Landroidx/appcompat/app/a$c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroidx/appcompat/app/a$c;->e()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/appcompat/widget/T$c;->g:Landroidx/appcompat/widget/T;

    .line 12
    .line 13
    iget-object v0, v0, Landroidx/appcompat/widget/T;->i:Landroidx/appcompat/widget/L;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    move v2, v1

    .line 21
    :goto_0
    if-ge v2, v0, :cond_1

    .line 22
    .line 23
    iget-object v3, p0, Landroidx/appcompat/widget/T$c;->g:Landroidx/appcompat/widget/T;

    .line 24
    .line 25
    iget-object v3, v3, Landroidx/appcompat/widget/T;->i:Landroidx/appcompat/widget/L;

    .line 26
    .line 27
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    if-ne v3, p1, :cond_0

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    move v4, v1

    .line 36
    :goto_1
    invoke-virtual {v3, v4}, Landroid/view/View;->setSelected(Z)V

    .line 37
    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-void
.end method
