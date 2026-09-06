.class public Lcom/android/launcher3/allapps/S;
.super Ljava/lang/Object;
.source "PluginHeaderRow.java"

# interfaces
.implements Lcom/android/launcher3/allapps/P;


# instance fields
.field private final g:Lx2/a;

.field final h:Landroid/view/View;


# direct methods
.method constructor <init>(Lx2/a;Lcom/android/launcher3/allapps/FloatingHeaderView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/allapps/S;->g:Lx2/a;

    .line 5
    .line 6
    invoke-interface {p1, p2}, Lx2/a;->d(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/launcher3/allapps/S;->h:Landroid/view/View;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public b(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/S;->h:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x4

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    if-nez p2, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/allapps/S;->h:Landroid/view/View;

    .line 14
    .line 15
    int-to-float p1, p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public d(Lcom/android/launcher3/allapps/FloatingHeaderView;[Lcom/android/launcher3/allapps/P;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public getExpectedHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/S;->g:Lx2/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lx2/a;->getExpectedHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFocusedChild()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getTypeClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/android/launcher3/allapps/S;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/android/launcher3/allapps/S;

    .line 2
    .line 3
    return-object p0
.end method
