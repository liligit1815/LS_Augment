.class LJ1/m$a;
.super Lcom/android/launcher3/popup/P;
.source "PinnedAppsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ1/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/popup/P<",
        "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Z

.field final synthetic h:LJ1/m;


# direct methods
.method constructor <init>(LJ1/m;Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;Z)V
    .locals 6

    .line 1
    iput-object p1, p0, LJ1/m$a;->h:LJ1/m;

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    const p1, 0x7f080d65

    .line 6
    .line 7
    .line 8
    :goto_0
    move v1, p1

    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const p1, 0x7f080d58

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :goto_1
    if-eqz p5, :cond_1

    .line 15
    .line 16
    const p1, 0x7f140343

    .line 17
    .line 18
    .line 19
    :goto_2
    move-object v0, p0

    .line 20
    move v2, p1

    .line 21
    move-object v3, p2

    .line 22
    move-object v4, p3

    .line 23
    move-object v5, p4

    .line 24
    goto :goto_3

    .line 25
    :cond_1
    const p1, 0x7f140035

    .line 26
    .line 27
    .line 28
    goto :goto_2

    .line 29
    :goto_3
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iput-boolean p5, v0, LJ1/m$a;->g:Z

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, LJ1/m$a;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, LJ1/m$a;->h:LJ1/m;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    invoke-static {p1}, LJ1/m;->h(LJ1/m;)Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v2, LJ1/l;

    .line 17
    .line 18
    invoke-direct {v2, v1}, LJ1/l;-><init>(Ljava/util/Set;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0, v2}, LJ1/m;->t(Lcom/android/launcher3/model/data/y;Ljava/util/function/Function;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p1, p0, LJ1/m$a;->h:LJ1/m;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    invoke-static {p1}, LJ1/m;->h(LJ1/m;)Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v2, LJ1/a;

    .line 37
    .line 38
    invoke-direct {v2, v1}, LJ1/a;-><init>(Ljava/util/Set;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0, v2}, LJ1/m;->t(Lcom/android/launcher3/model/data/y;Ljava/util/function/Function;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object p0, p0, LJ1/m$a;->h:LJ1/m;

    .line 45
    .line 46
    invoke-static {p0}, LJ1/m;->g(LJ1/m;)Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
