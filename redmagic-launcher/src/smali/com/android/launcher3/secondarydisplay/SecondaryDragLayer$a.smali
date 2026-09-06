.class Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;
.super Ljava/lang/Object;
.source "SecondaryDragLayer.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/p$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->i(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/dragndrop/v;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/dragndrop/v<",
            "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Lcom/android/launcher3/dragndrop/p;

.field final synthetic j:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->j:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->h:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->i:Lcom/android/launcher3/dragndrop/p;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->f(Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic f(Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->j:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->h(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->j:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->g(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p1, p0, p2}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->f0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(D)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/v;->w()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public b(Lcom/android/launcher3/n0$a;)V
    .locals 3

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->a(D)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->h:Landroid/view/View;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->i:Lcom/android/launcher3/dragndrop/p;

    .line 18
    .line 19
    new-instance v2, Lcom/android/launcher3/secondarydisplay/b;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0, v1}, Lcom/android/launcher3/secondarydisplay/b;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;Landroid/view/View;Lcom/android/launcher3/dragndrop/p;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v2}, Lcom/android/launcher3/dragndrop/v;->setOnScaleAnimEndCallback(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public c(Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 3
    .line 4
    return-void
.end method
