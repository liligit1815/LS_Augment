.class Lcom/zte/mifavor/widget/w$a;
.super Landroid/widget/ArrayAdapter;
.source "ZTEPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Ljava/lang/CharSequence;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;I[Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getCount()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-lez p3, :cond_3

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getCount()I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    const/4 v0, 0x1

    .line 18
    if-ne p3, v0, :cond_0

    .line 19
    .line 20
    sget p0, LR3/f;->s:I

    .line 21
    .line 22
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    return-object p2

    .line 26
    :cond_0
    if-nez p1, :cond_1

    .line 27
    .line 28
    sget p0, LR3/f;->u:I

    .line 29
    .line 30
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    return-object p2

    .line 34
    :cond_1
    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getCount()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    sub-int/2addr p0, v0

    .line 39
    if-ne p1, p0, :cond_2

    .line 40
    .line 41
    sget p0, LR3/f;->t:I

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 44
    .line 45
    .line 46
    return-object p2

    .line 47
    :cond_2
    sget p0, LR3/f;->r:I

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 50
    .line 51
    .line 52
    :cond_3
    return-object p2
.end method

.method public hasStableIds()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
