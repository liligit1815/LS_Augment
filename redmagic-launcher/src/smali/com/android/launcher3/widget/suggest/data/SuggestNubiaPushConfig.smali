.class public Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;
.super Lcom/android/launcher3/nubia/NubiaPushConfig;
.source "SuggestNubiaPushConfig.java"


# instance fields
.field public badgeNumber:I

.field public cls:Ljava/lang/String;

.field public h5:Ljava/lang/String;

.field public inSuggestWidget:Z

.field public pkg:Ljava/lang/String;

.field public pushIconUseAppBadge:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/nubia/NubiaPushConfig;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->inSuggestWidget:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput v1, p0, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->badgeNumber:I

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->pushIconUseAppBadge:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public isAvailable()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->inSuggestWidget:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->pkg:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getDeepLink()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->h5:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    :cond_0
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method
