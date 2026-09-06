.class public final Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictionsImpl;
.super Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;
.source "SecondaryDisplayPredictionsImpl.java"


# instance fields
.field private final g:Lcom/android/launcher3/views/k;

.field private final h:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictionsImpl;->h:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictionsImpl;->g:Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public b(Lz1/y0$c;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictionsImpl;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v0, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 18
    .line 19
    iget-object p1, p1, Lz1/y0$c;->b:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/appprediction/PredictionRowView;->setPredictedApps(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictionsImpl;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-class v1, Lcom/android/launcher3/appprediction/AppsDividerView;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/appprediction/AppsDividerView;

    .line 18
    .line 19
    sget-object v1, Lcom/android/launcher3/util/H1;->e:Lcom/android/launcher3/util/H1$a;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictionsImpl;->h:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/H1$a;->c(Landroid/content/Context;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    xor-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lcom/android/launcher3/appprediction/AppsDividerView;->setShowAllAppsLabel(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictionsImpl;->h:Landroid/content/Context;

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/H1$a;->d(Landroid/content/Context;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method
