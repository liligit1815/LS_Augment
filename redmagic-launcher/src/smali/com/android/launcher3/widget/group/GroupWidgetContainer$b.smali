.class Lcom/android/launcher3/widget/group/GroupWidgetContainer$b;
.super Landroid/view/ViewOutlineProvider;
.source "GroupWidgetContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/group/GroupWidgetContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/group/GroupWidgetContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$b;->a:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

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
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$b;->a:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->e(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    rsub-int/lit8 v2, v0, 0x0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$b;->a:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->f(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    rsub-int/lit8 v3, v0, 0x0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$b;->a:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->e(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-int v4, v0, v1

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$b;->a:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->f(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int v5, p1, v0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$b;->a:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->g(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)F

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    move-object v1, p2

    .line 48
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
