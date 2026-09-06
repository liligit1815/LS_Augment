.class Lcom/android/launcher3/widget/o$a;
.super Landroid/view/ViewOutlineProvider;
.source "BaseWidgetSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/o;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/o$a;->a:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/o$a;->a:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/widget/o;->t0(Lcom/android/launcher3/widget/o;)Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    iget-object p1, p0, Lcom/android/launcher3/widget/o$a;->a:Lcom/android/launcher3/widget/o;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/widget/o;->u0(Lcom/android/launcher3/widget/o;)Landroid/view/ViewGroup;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v0, p0, Lcom/android/launcher3/widget/o$a;->a:Lcom/android/launcher3/widget/o;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const v1, 0x7f070136

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    add-int v4, p1, v0

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/widget/o$a;->a:Lcom/android/launcher3/widget/o;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const p1, 0x7f070135

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    int-to-float v5, p0

    .line 50
    const/4 v1, 0x0

    .line 51
    const/4 v2, 0x0

    .line 52
    move-object v0, p2

    .line 53
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
