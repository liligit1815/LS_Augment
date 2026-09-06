.class Lcom/android/launcher3/views/SpringRelativeLayout$a;
.super Landroid/widget/EdgeEffect;
.source "SpringRelativeLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/SpringRelativeLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field private final a:Landroid/widget/EdgeEffect;

.field final synthetic b:Lcom/android/launcher3/views/SpringRelativeLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/views/SpringRelativeLayout;Landroid/content/Context;Landroid/widget/EdgeEffect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->b:Lcom/android/launcher3/views/SpringRelativeLayout;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a:Landroid/widget/EdgeEffect;

    .line 7
    .line 8
    return-void
.end method

.method private a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->b:Lcom/android/launcher3/views/SpringRelativeLayout;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->invalidate()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public finish()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EdgeEffect;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public isFinished()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onAbsorb(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onPull(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a:Landroid/widget/EdgeEffect;

    invoke-virtual {v0, p1}, Landroid/widget/EdgeEffect;->onPull(F)V

    .line 2
    invoke-direct {p0}, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a()V

    return-void
.end method

.method public onPull(FF)V
    .locals 1

    .line 3
    iget-object v0, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a:Landroid/widget/EdgeEffect;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EdgeEffect;->onPull(FF)V

    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a()V

    return-void
.end method

.method public onRelease()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/views/SpringRelativeLayout$a;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
