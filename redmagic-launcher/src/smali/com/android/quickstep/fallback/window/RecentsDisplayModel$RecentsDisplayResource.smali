.class public final Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;
.super Lcom/android/quickstep/DisplayModel$DisplayResource;
.source "RecentsDisplayModel.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/fallback/window/RecentsDisplayModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RecentsDisplayResource"
.end annotation


# instance fields
.field private final displayContext:Landroid/content/Context;

.field private final displayId:I

.field private final fallbackWindowInterface:Lcom/android/quickstep/FallbackWindowInterface;

.field private final recentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

.field private final taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

.field private final wallpaperColorHints:I


# direct methods
.method public constructor <init>(ILandroid/content/Context;I)V
    .locals 3

    .line 1
    const-string v0, "displayContext"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/quickstep/DisplayModel$DisplayResource;-><init>()V

    .line 7
    .line 8
    .line 9
    iput p1, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayId:I

    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayContext:Landroid/content/Context;

    .line 12
    .line 13
    iput p3, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->wallpaperColorHints:I

    .line 14
    .line 15
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    new-instance v1, Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 25
    .line 26
    invoke-direct {v1, p2, p3}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;-><init>(Landroid/content/Context;I)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-object v1, v2

    .line 31
    :goto_0
    iput-object v1, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->recentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-eqz p3, :cond_1

    .line 38
    .line 39
    new-instance v2, Lcom/android/quickstep/FallbackWindowInterface;

    .line 40
    .line 41
    invoke-direct {v2, v1}, Lcom/android/quickstep/FallbackWindowInterface;-><init>(Lcom/android/quickstep/fallback/window/RecentsWindowManager;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iput-object v2, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->fallbackWindowInterface:Lcom/android/quickstep/FallbackWindowInterface;

    .line 45
    .line 46
    new-instance p3, Lcom/android/quickstep/TaskAnimationManager;

    .line 47
    .line 48
    sget-object v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 49
    .line 50
    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 55
    .line 56
    invoke-direct {p3, p2, v0, p1}, Lcom/android/quickstep/TaskAnimationManager;-><init>(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;I)V

    .line 57
    .line 58
    .line 59
    iput-object p3, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 60
    .line 61
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;ILandroid/content/Context;IILjava/lang/Object;)Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x1

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayId:I

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p5, p4, 0x2

    .line 8
    .line 9
    if-eqz p5, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayContext:Landroid/content/Context;

    .line 12
    .line 13
    :cond_1
    and-int/lit8 p4, p4, 0x4

    .line 14
    .line 15
    if-eqz p4, :cond_2

    .line 16
    .line 17
    iget p3, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->wallpaperColorHints:I

    .line 18
    .line 19
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->copy(ILandroid/content/Context;I)Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method


# virtual methods
.method public cleanup()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->recentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->destroy()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final component1()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayId:I

    .line 2
    .line 3
    return p0
.end method

.method public final component2()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component3()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->wallpaperColorHints:I

    .line 2
    .line 3
    return p0
.end method

.method public final copy(ILandroid/content/Context;I)Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;
    .locals 0

    .line 1
    const-string p0, "displayContext"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 7
    .line 8
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;-><init>(ILandroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    const-string v0, "prefix"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "writer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "RecentsDisplayResource:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget v0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayId:I

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, "\tdisplayId="

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayContext:Landroid/content/Context;

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, "\tdisplayContext="

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget v0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->wallpaperColorHints:I

    .line 82
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v2, "\twallpaperColorHints="

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->recentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 107
    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v2, "\trecentsWindowManager="

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->fallbackWindowInterface:Lcom/android/quickstep/FallbackWindowInterface;

    .line 132
    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string p1, "\tfallbackWindowInterface="

    .line 142
    .line 143
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayId:I

    .line 14
    .line 15
    iget v3, p1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayId:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayContext:Landroid/content/Context;

    .line 21
    .line 22
    iget-object v3, p1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayContext:Landroid/content/Context;

    .line 23
    .line 24
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_3

    .line 29
    .line 30
    return v2

    .line 31
    :cond_3
    iget p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->wallpaperColorHints:I

    .line 32
    .line 33
    iget p1, p1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->wallpaperColorHints:I

    .line 34
    .line 35
    if-eq p0, p1, :cond_4

    .line 36
    .line 37
    return v2

    .line 38
    :cond_4
    return v0
.end method

.method public final getDisplayContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDisplayId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getFallbackWindowInterface()Lcom/android/quickstep/FallbackWindowInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->fallbackWindowInterface:Lcom/android/quickstep/FallbackWindowInterface;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRecentsWindowManager()Lcom/android/quickstep/fallback/window/RecentsWindowManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->recentsWindowManager:Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTaskAnimationManager()Lcom/android/quickstep/TaskAnimationManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->taskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getWallpaperColorHints()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->wallpaperColorHints:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayId:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayContext:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->wallpaperColorHints:I

    .line 19
    .line 20
    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    add-int/2addr v0, p0

    .line 25
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayId:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->displayContext:Landroid/content/Context;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->wallpaperColorHints:I

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v3, "RecentsDisplayResource(displayId="

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ", displayContext="

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ", wallpaperColorHints="

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, ")"

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
