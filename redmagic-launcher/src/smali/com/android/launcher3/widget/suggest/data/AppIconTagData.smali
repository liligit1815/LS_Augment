.class public Lcom/android/launcher3/widget/suggest/data/AppIconTagData;
.super Ljava/lang/Object;
.source "AppIconTagData.java"


# static fields
.field private static final DOUBLE_APP_KEY:Ljava/lang/String; = "_999"

.field private static final EMPTY_CLASS_NAME:Ljava/lang/String; = "."

.field private static final LOCKED_APP_KEY:Ljava/lang/String; = "_locked"


# instance fields
.field private cls:Ljava/lang/String;

.field public componentName:Landroid/content/ComponentName;
    .annotation runtime LB3/a;
    .end annotation
.end field

.field private defaultIcon:Ljava/lang/Boolean;

.field private forceUpdateIcon:Ljava/lang/Boolean;

.field private inAIFutureScreen:Ljava/lang/Boolean;

.field private isDoubleApp:Ljava/lang/Boolean;

.field private key:Ljava/lang/String;

.field private locked:Ljava/lang/Boolean;

.field private needShowStatement:Ljava/lang/Boolean;

.field private originPkg:Ljava/lang/String;

.field private pkg:Ljava/lang/String;

.field public prefixPkg:Ljava/lang/String;

.field private push:Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

.field private spanX:Ljava/lang/Integer;

.field private spanY:Ljava/lang/Integer;

.field private tagText:Ljava/lang/String;

.field public userHandle:Landroid/os/UserHandle;
    .annotation runtime LB3/a;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->locked:Ljava/lang/Boolean;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isDoubleApp:Ljava/lang/Boolean;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->inAIFutureScreen:Ljava/lang/Boolean;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->defaultIcon:Ljava/lang/Boolean;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->forceUpdateIcon:Ljava/lang/Boolean;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->needShowStatement:Ljava/lang/Boolean;

    .line 16
    .line 17
    const-string v0, ""

    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->key:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->key:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOriginPkg()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->originPkg:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->originPkg:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->pkg:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->pkg:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, ""

    .line 24
    .line 25
    return-object p0
.end method

.method public getSpanX()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->spanX:Ljava/lang/Integer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->spanX:Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public getSpanY()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->spanY:Ljava/lang/Integer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->spanY:Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public getSuggestNubiaPushConfig()Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->push:Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public isBanner()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSpanX()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-gt v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSpanY()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-le p0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    return v1
.end method

.method public isDefaultIcon()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->defaultIcon:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

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

.method public isDoubleApp()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isDoubleApp:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

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

.method public isForceUpdateIcon()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->forceUpdateIcon:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

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

.method public isInAIFutureScreen()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->inAIFutureScreen:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

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

.method public isLocked()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->locked:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

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

.method public isNeedShowStatement()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->needShowStatement:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

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

.method public setForceUpdateIcon(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->forceUpdateIcon:Ljava/lang/Boolean;

    .line 10
    .line 11
    return-void
.end method

.method public setNeedShowStatement(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->needShowStatement:Ljava/lang/Boolean;

    .line 10
    .line 11
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "AppIconTagData{"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->key:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isNeedShowStatement()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const-string v2, ""

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    const-string v1, ", needShowStatement=true"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v1, v2

    .line 28
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isDefaultIcon()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    const-string v1, ", isDefaultIcon=true"

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move-object v1, v2

    .line 41
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isInAIFutureScreen()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    const-string v2, ", inAIFutureScreen=true"

    .line 51
    .line 52
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p0, "}"

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public updateDatas(Ljava/lang/String;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->tagText:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isDoubleApp()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/16 v0, 0x3e7

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->userHandle:Landroid/os/UserHandle;

    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->pkg:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const-string v0, ""

    .line 33
    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    new-instance p1, Landroid/content/ComponentName;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->pkg:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->cls:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->cls:Ljava/lang/String;

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->pkg:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v3, "."

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    :goto_1
    invoke-direct {p1, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->componentName:Landroid/content/ComponentName;

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_2
    new-instance p1, Landroid/content/ComponentName;

    .line 77
    .line 78
    invoke-direct {p1, v0, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->componentName:Landroid/content/ComponentName;

    .line 82
    .line 83
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->componentName:Landroid/content/ComponentName;

    .line 89
    .line 90
    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isDoubleApp()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_3

    .line 102
    .line 103
    const-string v1, "_999"

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_3
    move-object v1, v0

    .line 107
    :goto_3
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isLocked()Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-eqz v1, :cond_4

    .line 115
    .line 116
    const-string v1, "_locked"

    .line 117
    .line 118
    goto :goto_4

    .line 119
    :cond_4
    move-object v1, v0

    .line 120
    :goto_4
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->isBanner()Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_5

    .line 128
    .line 129
    new-instance v1, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .line 133
    .line 134
    const-string v2, "_"

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSpanX()I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v2, "x"

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSpanY()I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    goto :goto_5

    .line 163
    :cond_5
    move-object v1, v0

    .line 164
    :goto_5
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->push:Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 168
    .line 169
    if-eqz v1, :cond_6

    .line 170
    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v1, "_push{id="

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->push:Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 182
    .line 183
    invoke-virtual {v1}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getPushId()J

    .line 184
    .line 185
    .line 186
    move-result-wide v1

    .line 187
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    const-string v1, ",pkg="

    .line 191
    .line 192
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->pkg:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v1, "}"

    .line 201
    .line 202
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    :cond_6
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->key:Ljava/lang/String;

    .line 217
    .line 218
    return-void
.end method
