.class Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;
.super Landroid/media/AudioManager$AudioPlaybackCallback;
.source "EarlyPauseAppUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/utils/EarlyPauseAppUtils;->initAudioManagerPlaybackListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/utils/EarlyPauseAppUtils;


# direct methods
.method constructor <init>(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;->this$0:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/AudioManager$AudioPlaybackCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPlaybackConfigChanged(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/media/AudioPlaybackConfiguration;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/media/AudioManager$AudioPlaybackCallback;->onPlaybackConfigChanged(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v1, 0x0

    .line 14
    move v2, v1

    .line 15
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Landroid/media/AudioPlaybackConfiguration;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/media/AudioPlaybackConfiguration;->getPlayerState()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/4 v4, 0x2

    .line 32
    if-ne v3, v4, :cond_0

    .line 33
    .line 34
    iget-object v2, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;->this$0:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 35
    .line 36
    invoke-static {v2, v0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->t(Lcom/android/quickstep/utils/EarlyPauseAppUtils;Ljava/util/ArrayList;)V

    .line 37
    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v3, "onPlaybackConfigChanged isPlaying = "

    .line 47
    .line 48
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v3, "-pid-"

    .line 55
    .line 56
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string v3, "EarlyPauseAppUtils"

    .line 67
    .line 68
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    if-nez v2, :cond_2

    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;->this$0:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->n(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)Ljava/util/ArrayList;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;->this$0:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 83
    .line 84
    invoke-static {p0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->j(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)Ljava/util/ArrayList;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;->this$0:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 93
    .line 94
    invoke-static {p1, v0}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->w(Lcom/android/quickstep/utils/EarlyPauseAppUtils;Ljava/util/ArrayList;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_3

    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;->this$0:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->n(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)Ljava/util/ArrayList;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 107
    .line 108
    .line 109
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-ge v1, p1, :cond_3

    .line 114
    .line 115
    iget-object p1, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;->this$0:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    check-cast v2, Ljava/lang/Integer;

    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    invoke-static {p1, v2}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->v(Lcom/android/quickstep/utils/EarlyPauseAppUtils;I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iget-object v2, p0, Lcom/android/quickstep/utils/EarlyPauseAppUtils$1;->this$0:Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 132
    .line 133
    invoke-static {v2}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->n(Lcom/android/quickstep/utils/EarlyPauseAppUtils;)Ljava/util/ArrayList;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    new-instance v2, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .line 144
    .line 145
    const-string v4, "onPlaybackConfigChanged pkg = "

    .line 146
    .line 147
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    add-int/lit8 v1, v1, 0x1

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_3
    return-void
.end method
