.class public Lcom/android/launcher3/K5;
.super Landroid/view/ViewGroup;
.source "ShortcutAndWidgetContainer.java"

# interfaces
.implements Lcom/android/launcher3/folder/FolderIcon$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/K5$a;,
        Lcom/android/launcher3/K5$b;
    }
.end annotation


# instance fields
.field private final g:[I

.field private final h:I

.field private final i:Landroid/app/WallpaperManager;

.field private j:I

.field private k:I

.field private l:Landroid/graphics/Point;

.field private m:I

.field private n:I

.field private final o:Lcom/android/launcher3/views/k;

.field private p:Z

.field public q:Z

.field private r:Lcom/android/launcher3/K5$a;

.field private s:Z

.field public t:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/launcher3/K5$b;",
            ">;"
        }
    .end annotation
.end field

.field private u:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [I

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/K5;->g:[I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/android/launcher3/K5;->p:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/K5;->q:Z

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-object v1, p0, Lcom/android/launcher3/K5;->r:Lcom/android/launcher3/K5$a;

    .line 16
    .line 17
    new-instance v1, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lcom/android/launcher3/K5;->t:Ljava/util/HashMap;

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/K5;->u:Z

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 31
    .line 32
    iput-object v1, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 33
    .line 34
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/android/launcher3/K5;->i:Landroid/app/WallpaperManager;

    .line 39
    .line 40
    iput p2, p0, Lcom/android/launcher3/K5;->h:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/K5;->t:Ljava/util/HashMap;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private l(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p1, 0x7f0b051c

    .line 6
    .line 7
    .line 8
    if-ne p0, p1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method private o()V
    .locals 4

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget v0, p0, Lcom/android/launcher3/K5;->h:I

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-eq v0, v1, :cond_0

    .line 25
    .line 26
    const/4 v1, 0x4

    .line 27
    if-ne v0, v1, :cond_2

    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v1, 0x0

    .line 48
    :goto_0
    if-ge v1, v0, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    instance-of v3, v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 55
    .line 56
    if-eqz v3, :cond_1

    .line 57
    .line 58
    check-cast v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->F1()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->v1()V

    .line 64
    .line 65
    .line 66
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    return-void
.end method

.method private p()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_4

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v2, v1, Lcom/android/launcher3/widget/T;

    .line 13
    .line 14
    if-eqz v2, :cond_3

    .line 15
    .line 16
    move-object v2, v1

    .line 17
    check-cast v2, Lcom/android/launcher3/widget/T;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p0, v2}, Lcom/android/launcher3/K5;->g(I)Lcom/android/launcher3/K5$b;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-eqz v2, :cond_3

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getScaleX()F

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    iget v4, v2, Lcom/android/launcher3/K5$b;->a:F

    .line 34
    .line 35
    cmpl-float v3, v3, v4

    .line 36
    .line 37
    const-string v4, "ShortcutAndWidgetContainer"

    .line 38
    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    new-instance v3, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v5, "launcherIconAnimation: resetWidgetParameter mLayoutChildScaleX="

    .line 47
    .line 48
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget v5, v2, Lcom/android/launcher3/K5$b;->a:F

    .line 52
    .line 53
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    iget v3, v2, Lcom/android/launcher3/K5$b;->a:F

    .line 64
    .line 65
    invoke-virtual {v1, v3}, Landroid/view/View;->setScaleX(F)V

    .line 66
    .line 67
    .line 68
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getScaleY()F

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    iget v5, v2, Lcom/android/launcher3/K5$b;->b:F

    .line 73
    .line 74
    cmpl-float v3, v3, v5

    .line 75
    .line 76
    if-eqz v3, :cond_1

    .line 77
    .line 78
    new-instance v3, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v5, "launcherIconAnimation: resetWidgetParameter mLayoutChildScaleY="

    .line 84
    .line 85
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v5, v2, Lcom/android/launcher3/K5$b;->b:F

    .line 89
    .line 90
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    iget v3, v2, Lcom/android/launcher3/K5$b;->b:F

    .line 101
    .line 102
    invoke-virtual {v1, v3}, Landroid/view/View;->setScaleY(F)V

    .line 103
    .line 104
    .line 105
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getTranslationX()F

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    iget v5, v2, Lcom/android/launcher3/K5$b;->c:F

    .line 110
    .line 111
    cmpl-float v3, v3, v5

    .line 112
    .line 113
    if-eqz v3, :cond_2

    .line 114
    .line 115
    new-instance v3, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    const-string v5, "launcherIconAnimation: resetWidgetParameter mLayoutChildTranslationX="

    .line 121
    .line 122
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget v5, v2, Lcom/android/launcher3/K5$b;->c:F

    .line 126
    .line 127
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    iget v3, v2, Lcom/android/launcher3/K5$b;->c:F

    .line 138
    .line 139
    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 140
    .line 141
    .line 142
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    iget v5, v2, Lcom/android/launcher3/K5$b;->d:F

    .line 147
    .line 148
    cmpl-float v3, v3, v5

    .line 149
    .line 150
    if-eqz v3, :cond_3

    .line 151
    .line 152
    new-instance v3, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    const-string v5, "launcherIconAnimation: resetWidgetParameter mLayoutChildTranslationY="

    .line 158
    .line 159
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    iget v5, v2, Lcom/android/launcher3/K5$b;->d:F

    .line 163
    .line 164
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    iget v2, v2, Lcom/android/launcher3/K5$b;->d:F

    .line 175
    .line 176
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 177
    .line 178
    .line 179
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :cond_4
    invoke-direct {p0}, Lcom/android/launcher3/K5;->d()V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method private r(Lc1/b;Landroid/view/View;)V
    .locals 10

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/K5;->getCountX()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    :cond_0
    move v8, v0

    .line 48
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 59
    .line 60
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0, v8}, Lp1/f;->c(Lcom/android/launcher3/C2;I)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget v1, p0, Lcom/android/launcher3/K5;->j:I

    .line 69
    .line 70
    :goto_0
    move v4, v0

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0, v8}, Lp1/f;->d(Lcom/android/launcher3/C2;I)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    iget v0, p0, Lcom/android/launcher3/K5;->k:I

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :goto_1
    iget v0, p0, Lcom/android/launcher3/K5;->j:I

    .line 86
    .line 87
    iget v6, p0, Lcom/android/launcher3/K5;->k:I

    .line 88
    .line 89
    const v2, 0x7f0b04c8

    .line 90
    .line 91
    .line 92
    invoke-virtual {p2, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    instance-of v2, p2, Ljava/lang/Integer;

    .line 97
    .line 98
    if-eqz v2, :cond_2

    .line 99
    .line 100
    check-cast p2, Ljava/lang/Integer;

    .line 101
    .line 102
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 107
    .line 108
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v0, v8, p2}, Lp1/f;->l(Lcom/android/launcher3/C2;II)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    move v3, v1

    .line 117
    move v5, v3

    .line 118
    goto :goto_2

    .line 119
    :cond_2
    move v5, v0

    .line 120
    move v3, v1

    .line 121
    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {p0}, Lcom/android/launcher3/K5;->j()Z

    .line 126
    .line 127
    .line 128
    move-result v7

    .line 129
    const/4 v9, 0x1

    .line 130
    move-object v1, p1

    .line 131
    invoke-virtual/range {v1 .. v9}, Lc1/b;->l(Landroid/content/Context;IIIIZIZ)V

    .line 132
    .line 133
    .line 134
    :cond_3
    return-void
.end method

.method private setupHotseat(Lc1/b;)V
    .locals 11

    .line 1
    iget-boolean v0, p1, Lc1/b;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v1, p0, Lcom/android/launcher3/K5;->n:I

    .line 23
    .line 24
    invoke-static {v0, v1}, Lp1/f;->c(Lcom/android/launcher3/C2;I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget v1, p0, Lcom/android/launcher3/K5;->j:I

    .line 29
    .line 30
    :goto_0
    move v5, v0

    .line 31
    move v4, v1

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget v1, p0, Lcom/android/launcher3/K5;->m:I

    .line 40
    .line 41
    invoke-static {v0, v1}, Lp1/f;->d(Lcom/android/launcher3/C2;I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget v0, p0, Lcom/android/launcher3/K5;->k:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget v6, p0, Lcom/android/launcher3/K5;->j:I

    .line 53
    .line 54
    iget v7, p0, Lcom/android/launcher3/K5;->k:I

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/K5;->j()Z

    .line 57
    .line 58
    .line 59
    move-result v8

    .line 60
    iget v9, p0, Lcom/android/launcher3/K5;->m:I

    .line 61
    .line 62
    const/4 v10, 0x0

    .line 63
    move-object v2, p1

    .line 64
    invoke-virtual/range {v2 .. v10}, Lc1/b;->l(Landroid/content/Context;IIIIZIZ)V

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lc1/b;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p1, Lc1/b;->i:Z

    .line 9
    .line 10
    iget p1, p0, Lcom/android/launcher3/K5;->h:I

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->u()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public b(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-super {p0, p1, v0, p2, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()V
    .locals 2

    .line 1
    const-string v0, "ShortcutAndWidgetContainer"

    .line 2
    .line 3
    const-string v1, "launcherIconAnimation: beginDeferringUpdates!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/K5;->u:Z

    .line 10
    .line 11
    return-void
.end method

.method public cancelLongPress()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->cancelLongPress()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Landroid/view/View;->cancelLongPress()V

    .line 16
    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "launcherIconAnimation: endDeferringUpdates!! mDeferUpdates = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/K5;->u:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "ShortcutAndWidgetContainer"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/android/launcher3/K5;->u:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/android/launcher3/K5;->u:Z

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0}, Lcom/android/launcher3/K5;->p()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public f(II)Landroid/view/View;
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Lc1/b;

    .line 17
    .line 18
    invoke-virtual {v3}, Lc1/b;->a()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-gt v4, p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v3}, Lc1/b;->a()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    iget v5, v3, Lc1/b;->f:I

    .line 29
    .line 30
    add-int/2addr v4, v5

    .line 31
    if-ge p1, v4, :cond_0

    .line 32
    .line 33
    invoke-virtual {v3}, Lc1/b;->b()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-gt v4, p2, :cond_0

    .line 38
    .line 39
    invoke-virtual {v3}, Lc1/b;->b()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    iget v3, v3, Lc1/b;->g:I

    .line 44
    .line 45
    add-int/2addr v4, v3

    .line 46
    if-ge p2, v4, :cond_0

    .line 47
    .line 48
    return-object v2

    .line 49
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method

.method public g(I)Lcom/android/launcher3/K5$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/K5;->t:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/android/launcher3/K5$b;

    .line 12
    .line 13
    return-object p0
.end method

.method public getCellContentHeight()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget p0, p0, Lcom/android/launcher3/K5;->h:I

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Lcom/android/launcher3/h0;->a0(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public getCountX()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/K5;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getCountY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/K5;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getTranslationProvider()Lcom/android/launcher3/K5$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/K5;->r:Lcom/android/launcher3/K5$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Lc1/b;)I
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/K5;->h:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    iget-boolean p0, p1, Lc1/b;->o:Z

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    iput-boolean p0, p1, Lc1/b;->o:Z

    .line 12
    .line 13
    :cond_0
    iget p0, p1, Lc1/b;->j:I

    .line 14
    .line 15
    return p0
.end method

.method public i(Lc1/b;)I
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/K5;->h:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    iget-boolean p0, p1, Lc1/b;->o:Z

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    iput-boolean p0, p1, Lc1/b;->o:Z

    .line 12
    .line 13
    :cond_0
    iget p0, p1, Lc1/b;->k:I

    .line 14
    .line 15
    return p0
.end method

.method public j()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/K5;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/K5;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public m(Landroid/view/View;)V
    .locals 14

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v6, v0

    .line 6
    check-cast v6, Lc1/b;

    .line 7
    .line 8
    instance-of v0, p1, Lcom/android/launcher3/widget/x0;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    move-object v0, p1

    .line 13
    check-cast v0, Lcom/android/launcher3/widget/x0;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Lcom/android/launcher3/h0;->Y(Lcom/android/launcher3/model/data/y;)Landroid/graphics/PointF;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget v9, v2, Landroid/graphics/PointF;->x:F

    .line 32
    .line 33
    iget v10, v2, Landroid/graphics/PointF;->y:F

    .line 34
    .line 35
    iget-boolean v2, p0, Lcom/android/launcher3/K5;->u:Z

    .line 36
    .line 37
    const/high16 v3, 0x40000000    # 2.0f

    .line 38
    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    const-string v2, "ShortcutAndWidgetContainer"

    .line 42
    .line 43
    const-string v4, "launcherIconAnimation: layoutChild: the UnlockAnimation is Running!"

    .line 44
    .line 45
    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    new-instance v7, Lcom/android/launcher3/K5$b;

    .line 49
    .line 50
    iget v2, v6, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 51
    .line 52
    int-to-float v4, v2

    .line 53
    int-to-float v2, v2

    .line 54
    mul-float/2addr v2, v9

    .line 55
    sub-float/2addr v4, v2

    .line 56
    neg-float v2, v4

    .line 57
    div-float v11, v2, v3

    .line 58
    .line 59
    iget v2, v6, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 60
    .line 61
    int-to-float v4, v2

    .line 62
    int-to-float v2, v2

    .line 63
    mul-float/2addr v2, v10

    .line 64
    sub-float/2addr v4, v2

    .line 65
    neg-float v2, v4

    .line 66
    div-float v12, v2, v3

    .line 67
    .line 68
    move-object v8, p0

    .line 69
    invoke-direct/range {v7 .. v12}, Lcom/android/launcher3/K5$b;-><init>(Lcom/android/launcher3/K5;FFFF)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/android/launcher3/K5;->t:Ljava/util/HashMap;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v2, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    invoke-static {v9, v10}, Ljava/lang/Math;->min(FF)F

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/x0;->setScaleToFit(F)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/android/launcher3/widget/x0;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iget v2, v6, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 98
    .line 99
    int-to-float v4, v2

    .line 100
    int-to-float v2, v2

    .line 101
    mul-float/2addr v2, v9

    .line 102
    sub-float/2addr v4, v2

    .line 103
    neg-float v2, v4

    .line 104
    div-float/2addr v2, v3

    .line 105
    iget v4, v6, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 106
    .line 107
    int-to-float v5, v4

    .line 108
    int-to-float v4, v4

    .line 109
    mul-float/2addr v4, v10

    .line 110
    sub-float/2addr v5, v4

    .line 111
    neg-float v4, v5

    .line 112
    div-float/2addr v4, v3

    .line 113
    const/4 v3, 0x4

    .line 114
    invoke-virtual {v0, v3, v2, v4}, Lcom/android/launcher3/util/z1;->c(IFF)V

    .line 115
    .line 116
    .line 117
    :cond_1
    :goto_0
    iget v2, v6, Lc1/b;->j:I

    .line 118
    .line 119
    iget v3, v6, Lc1/b;->k:I

    .line 120
    .line 121
    instance-of v0, p1, Lcom/android/launcher3/widget/T;

    .line 122
    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    move-object v0, p1

    .line 126
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/android/launcher3/widget/T;->getCellChildViewPreLayoutListener()Lcom/android/launcher3/widget/T$a;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    if-eqz v4, :cond_2

    .line 133
    .line 134
    invoke-virtual {v0}, Lcom/android/launcher3/widget/T;->getCellChildViewPreLayoutListener()Lcom/android/launcher3/widget/T$a;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iget v4, v6, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 139
    .line 140
    add-int/2addr v4, v2

    .line 141
    iget v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 142
    .line 143
    add-int/2addr v5, v3

    .line 144
    move-object v1, p1

    .line 145
    invoke-interface/range {v0 .. v5}, Lcom/android/launcher3/widget/T$a;->a(Landroid/view/View;IIII)V

    .line 146
    .line 147
    .line 148
    :cond_2
    iget v0, p0, Lcom/android/launcher3/K5;->h:I

    .line 149
    .line 150
    const/4 v4, 0x1

    .line 151
    if-ne v0, v4, :cond_3

    .line 152
    .line 153
    iget-boolean v0, v6, Lc1/b;->o:Z

    .line 154
    .line 155
    if-nez v0, :cond_4

    .line 156
    .line 157
    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 158
    .line 159
    add-int/2addr v0, v2

    .line 160
    iget v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 161
    .line 162
    add-int/2addr v5, v3

    .line 163
    invoke-virtual {p1, v2, v3, v0, v5}, Landroid/view/View;->layout(IIII)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_3
    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 168
    .line 169
    add-int/2addr v0, v2

    .line 170
    iget v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 171
    .line 172
    add-int/2addr v5, v3

    .line 173
    invoke-virtual {p1, v2, v3, v0, v5}, Landroid/view/View;->layout(IIII)V

    .line 174
    .line 175
    .line 176
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/K5;->r:Lcom/android/launcher3/K5$a;

    .line 177
    .line 178
    if-eqz v0, :cond_6

    .line 179
    .line 180
    invoke-virtual {v6}, Lc1/b;->a()I

    .line 181
    .line 182
    .line 183
    move-result v5

    .line 184
    invoke-interface {v0, v5}, Lcom/android/launcher3/K5$a;->a(I)F

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    instance-of v5, p1, Lcom/android/launcher3/G5;

    .line 189
    .line 190
    if-eqz v5, :cond_5

    .line 191
    .line 192
    move-object v1, p1

    .line 193
    check-cast v1, Lcom/android/launcher3/G5;

    .line 194
    .line 195
    invoke-interface {v1}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    const/4 v5, 0x3

    .line 200
    invoke-virtual {v1, v5}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 205
    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_5
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 209
    .line 210
    .line 211
    :cond_6
    :goto_2
    iget-boolean v0, v6, Lc1/b;->l:Z

    .line 212
    .line 213
    if-eqz v0, :cond_7

    .line 214
    .line 215
    const/4 v0, 0x0

    .line 216
    iput-boolean v0, v6, Lc1/b;->l:Z

    .line 217
    .line 218
    iget-object v1, p0, Lcom/android/launcher3/K5;->g:[I

    .line 219
    .line 220
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 221
    .line 222
    .line 223
    iget-object v7, p0, Lcom/android/launcher3/K5;->i:Landroid/app/WallpaperManager;

    .line 224
    .line 225
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;

    .line 226
    .line 227
    .line 228
    move-result-object v8

    .line 229
    aget p0, v1, v0

    .line 230
    .line 231
    add-int/2addr p0, v2

    .line 232
    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 233
    .line 234
    div-int/lit8 v0, v0, 0x2

    .line 235
    .line 236
    add-int v10, p0, v0

    .line 237
    .line 238
    aget p0, v1, v4

    .line 239
    .line 240
    add-int/2addr p0, v3

    .line 241
    iget v0, v6, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 242
    .line 243
    div-int/lit8 v0, v0, 0x2

    .line 244
    .line 245
    add-int v11, p0, v0

    .line 246
    .line 247
    const/4 v12, 0x0

    .line 248
    const/4 v13, 0x0

    .line 249
    const-string v9, "android.home.drop"

    .line 250
    .line 251
    invoke-virtual/range {v7 .. v13}, Landroid/app/WallpaperManager;->sendWallpaperCommand(Landroid/os/IBinder;Ljava/lang/String;IIILandroid/os/Bundle;)V

    .line 252
    .line 253
    .line 254
    :cond_7
    return-void
.end method

.method public n(Landroid/view/View;)V
    .locals 12

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v1, v0

    .line 6
    check-cast v1, Lc1/b;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v2, p1, Lcom/android/launcher3/widget/x0;

    .line 15
    .line 16
    const/4 v11, 0x0

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/android/launcher3/h0;->Y(Lcom/android/launcher3/model/data/y;)Landroid/graphics/PointF;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    move-object v3, v2

    .line 30
    iget v2, p0, Lcom/android/launcher3/K5;->j:I

    .line 31
    .line 32
    move-object v4, v3

    .line 33
    iget v3, p0, Lcom/android/launcher3/K5;->k:I

    .line 34
    .line 35
    move-object v5, v4

    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/K5;->j()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    move-object v6, v5

    .line 41
    iget v5, p0, Lcom/android/launcher3/K5;->m:I

    .line 42
    .line 43
    move-object v7, v6

    .line 44
    iget v6, p0, Lcom/android/launcher3/K5;->n:I

    .line 45
    .line 46
    move-object v8, v7

    .line 47
    iget v7, v8, Landroid/graphics/PointF;->x:F

    .line 48
    .line 49
    iget v8, v8, Landroid/graphics/PointF;->y:F

    .line 50
    .line 51
    iget-object v9, p0, Lcom/android/launcher3/K5;->l:Landroid/graphics/Point;

    .line 52
    .line 53
    iget-object v10, v0, Lcom/android/launcher3/h0;->m3:Landroid/graphics/Rect;

    .line 54
    .line 55
    invoke-virtual/range {v1 .. v10}, Lc1/b;->j(IIZIIFFLandroid/graphics/Point;Landroid/graphics/Rect;)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_9

    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 65
    .line 66
    instance-of v2, v0, Lcom/android/launcher3/C2;

    .line 67
    .line 68
    if-eqz v2, :cond_9

    .line 69
    .line 70
    instance-of v2, p1, Lcom/android/launcher3/widget/custom/future/d;

    .line 71
    .line 72
    if-eqz v2, :cond_9

    .line 73
    .line 74
    iput v11, v1, Lc1/b;->j:I

    .line 75
    .line 76
    iput v11, v1, Lc1/b;->k:I

    .line 77
    .line 78
    check-cast v0, Lcom/android/launcher3/C2;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 89
    .line 90
    iget-object p0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 91
    .line 92
    check-cast p0, Lcom/android/launcher3/C2;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    iput p0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 103
    .line 104
    goto/16 :goto_2

    .line 105
    .line 106
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/K5;->l(Landroid/view/View;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_1

    .line 111
    .line 112
    iget v2, p0, Lcom/android/launcher3/K5;->j:I

    .line 113
    .line 114
    iget v3, p0, Lcom/android/launcher3/K5;->k:I

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/android/launcher3/K5;->j()Z

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    iget v5, p0, Lcom/android/launcher3/K5;->m:I

    .line 121
    .line 122
    iget v6, p0, Lcom/android/launcher3/K5;->n:I

    .line 123
    .line 124
    iget-object v7, p0, Lcom/android/launcher3/K5;->l:Landroid/graphics/Point;

    .line 125
    .line 126
    invoke-virtual/range {v1 .. v7}, Lc1/b;->k(IIZIILandroid/graphics/Point;)V

    .line 127
    .line 128
    .line 129
    goto/16 :goto_2

    .line 130
    .line 131
    :cond_1
    sget-object v2, Lf1/a;->x:Lf1/a$a;

    .line 132
    .line 133
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    const/4 v8, 0x1

    .line 138
    if-eqz v3, :cond_3

    .line 139
    .line 140
    iget v3, p0, Lcom/android/launcher3/K5;->h:I

    .line 141
    .line 142
    if-ne v3, v8, :cond_3

    .line 143
    .line 144
    instance-of v2, p1, Lcom/android/launcher3/W;

    .line 145
    .line 146
    if-eqz v2, :cond_2

    .line 147
    .line 148
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->p()Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-nez v2, :cond_2

    .line 157
    .line 158
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    const v3, 0x7f070495

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    iput v2, p0, Lcom/android/launcher3/K5;->k:I

    .line 170
    .line 171
    iput v2, p0, Lcom/android/launcher3/K5;->j:I

    .line 172
    .line 173
    :cond_2
    invoke-direct {p0, v1}, Lcom/android/launcher3/K5;->setupHotseat(Lc1/b;)V

    .line 174
    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_3
    invoke-static {}, Lx1/O;->C3()Z

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    if-eqz v3, :cond_4

    .line 182
    .line 183
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    if-eqz v2, :cond_4

    .line 188
    .line 189
    iget v2, p0, Lcom/android/launcher3/K5;->h:I

    .line 190
    .line 191
    const/4 v3, 0x4

    .line 192
    if-ne v2, v3, :cond_4

    .line 193
    .line 194
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/K5;->r(Lc1/b;Landroid/view/View;)V

    .line 195
    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_4
    iget v2, p0, Lcom/android/launcher3/K5;->j:I

    .line 199
    .line 200
    iget v3, p0, Lcom/android/launcher3/K5;->k:I

    .line 201
    .line 202
    invoke-virtual {p0}, Lcom/android/launcher3/K5;->j()Z

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    iget v5, p0, Lcom/android/launcher3/K5;->m:I

    .line 207
    .line 208
    iget v6, p0, Lcom/android/launcher3/K5;->n:I

    .line 209
    .line 210
    iget-object v7, p0, Lcom/android/launcher3/K5;->l:Landroid/graphics/Point;

    .line 211
    .line 212
    invoke-virtual/range {v1 .. v7}, Lc1/b;->k(IIZIILandroid/graphics/Point;)V

    .line 213
    .line 214
    .line 215
    :goto_0
    iget v2, p0, Lcom/android/launcher3/K5;->h:I

    .line 216
    .line 217
    if-ne v2, v8, :cond_5

    .line 218
    .line 219
    iget-object v2, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 220
    .line 221
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    iget v2, v2, Lcom/android/launcher3/X3;->F:I

    .line 226
    .line 227
    goto :goto_1

    .line 228
    :cond_5
    iget-object v2, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 229
    .line 230
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    iget v2, v2, Lcom/android/launcher3/X3;->s:I

    .line 235
    .line 236
    :goto_1
    iget-object v3, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 237
    .line 238
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    iget v3, v3, Lcom/android/launcher3/X3;->t:I

    .line 243
    .line 244
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    instance-of v4, v4, Lcom/android/launcher3/model/data/y;

    .line 249
    .line 250
    if-eqz v4, :cond_6

    .line 251
    .line 252
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 257
    .line 258
    iget-boolean v4, v4, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 259
    .line 260
    if-eqz v4, :cond_6

    .line 261
    .line 262
    iget-object v3, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 263
    .line 264
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    iget v3, v3, Lcom/android/launcher3/X3;->v:I

    .line 269
    .line 270
    :cond_6
    iget-boolean v4, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 271
    .line 272
    if-eqz v4, :cond_7

    .line 273
    .line 274
    instance-of v4, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 275
    .line 276
    if-eqz v4, :cond_7

    .line 277
    .line 278
    iget-object v2, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 279
    .line 280
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    iget v3, v2, Lcom/android/launcher3/X3;->q0:I

    .line 285
    .line 286
    iget-object v2, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 287
    .line 288
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    iget v2, v2, Lcom/android/launcher3/X3;->s0:I

    .line 293
    .line 294
    :cond_7
    iget-boolean v0, v0, Lcom/android/launcher3/X3;->B0:Z

    .line 295
    .line 296
    if-eqz v0, :cond_8

    .line 297
    .line 298
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    instance-of v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 307
    .line 308
    if-eqz v0, :cond_8

    .line 309
    .line 310
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 319
    .line 320
    invoke-virtual {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolderIconPaddingX()I

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 325
    .line 326
    .line 327
    move-result-object v2

    .line 328
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 329
    .line 330
    .line 331
    move-result-object v2

    .line 332
    check-cast v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 333
    .line 334
    invoke-virtual {v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getFolderIconPaddingY()I

    .line 335
    .line 336
    .line 337
    move-result v2

    .line 338
    invoke-virtual {p1, v0, v2, v0, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 339
    .line 340
    .line 341
    invoke-virtual {p0, v11}, Landroid/view/ViewGroup;->setDefaultFocusHighlightEnabled(Z)V

    .line 342
    .line 343
    .line 344
    goto :goto_2

    .line 345
    :cond_8
    invoke-virtual {p1, v3, v2, v3, v11}, Landroid/view/View;->setPadding(IIII)V

    .line 346
    .line 347
    .line 348
    :cond_9
    :goto_2
    iget p0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 349
    .line 350
    const/high16 v0, 0x40000000    # 2.0f

    .line 351
    .line 352
    invoke-static {p0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 353
    .line 354
    .line 355
    move-result p0

    .line 356
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 357
    .line 358
    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    invoke-virtual {p1, p0, v0}, Landroid/view/View;->measure(II)V

    .line 363
    .line 364
    .line 365
    instance-of p0, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 366
    .line 367
    if-eqz p0, :cond_a

    .line 368
    .line 369
    check-cast p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 370
    .line 371
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getFolderName()Lcom/android/launcher3/BubbleTextView;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 376
    .line 377
    .line 378
    :cond_a
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getAlpha()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    cmpl-float v0, v0, v1

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    const-string p1, "ShortcutAndWidgetConteiner#onLayout"

    .line 2
    .line 3
    invoke-static {p1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/android/launcher3/K5;->q:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 p2, 0x0

    .line 14
    :goto_0
    if-ge p2, p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    .line 21
    .line 22
    .line 23
    move-result p4

    .line 24
    const/16 p5, 0x8

    .line 25
    .line 26
    if-eq p4, p5, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p3}, Lcom/android/launcher3/K5;->m(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    :goto_0
    if-ge p1, v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/16 v2, 0x8

    .line 30
    .line 31
    if-eq v1, v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Lcom/android/launcher3/K5;->n(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void
.end method

.method protected onSetAlpha(I)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->i(Lcom/android/launcher3/K5;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onSetAlpha(I)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewAdded(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    instance-of v0, p1, Lcom/android/launcher3/widget/suggest/m;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Lcom/android/launcher3/widget/suggest/m;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/widget/suggest/m;->J0()V

    .line 18
    .line 19
    .line 20
    :cond_0
    instance-of p1, p1, Lcom/android/launcher3/widget/custom/future/d;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p0, Lcom/android/launcher3/K5;->s:Z

    .line 26
    .line 27
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/K5;->o()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/K5;->o()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q(IIIILandroid/graphics/Point;)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/K5;->j:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/K5;->k:I

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/K5;->m:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/K5;->n:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/K5;->l:Landroid/graphics/Point;

    .line 10
    .line 11
    return-void
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    new-instance p2, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->requestRectangleOnScreen(Landroid/graphics/Rect;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setInvertIfRtl(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/K5;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method setTranslationProvider(Lcom/android/launcher3/K5$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/K5;->r:Lcom/android/launcher3/K5$a;

    .line 2
    .line 3
    return-void
.end method

.method public setupLp(Landroid/view/View;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v1, v0

    .line 6
    check-cast v1, Lc1/b;

    .line 7
    .line 8
    instance-of v0, p1, Lcom/android/launcher3/widget/x0;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/K5;->o:Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/android/launcher3/h0;->Y(Lcom/android/launcher3/model/data/y;)Landroid/graphics/PointF;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget v2, p0, Lcom/android/launcher3/K5;->j:I

    .line 29
    .line 30
    iget v3, p0, Lcom/android/launcher3/K5;->k:I

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/K5;->j()Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    iget v5, p0, Lcom/android/launcher3/K5;->m:I

    .line 37
    .line 38
    iget v6, p0, Lcom/android/launcher3/K5;->n:I

    .line 39
    .line 40
    iget v7, p1, Landroid/graphics/PointF;->x:F

    .line 41
    .line 42
    iget v8, p1, Landroid/graphics/PointF;->y:F

    .line 43
    .line 44
    iget-object v9, p0, Lcom/android/launcher3/K5;->l:Landroid/graphics/Point;

    .line 45
    .line 46
    iget-object v10, v0, Lcom/android/launcher3/h0;->m3:Landroid/graphics/Rect;

    .line 47
    .line 48
    invoke-virtual/range {v1 .. v10}, Lc1/b;->j(IIZIIFFLandroid/graphics/Point;Landroid/graphics/Rect;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 53
    .line 54
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    iget v2, p0, Lcom/android/launcher3/K5;->h:I

    .line 61
    .line 62
    const/4 v3, 0x1

    .line 63
    if-ne v2, v3, :cond_1

    .line 64
    .line 65
    invoke-direct {p0, v1}, Lcom/android/launcher3/K5;->setupHotseat(Lc1/b;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-static {}, Lx1/O;->C3()Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_2

    .line 74
    .line 75
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    iget v0, p0, Lcom/android/launcher3/K5;->h:I

    .line 82
    .line 83
    const/4 v2, 0x4

    .line 84
    if-ne v0, v2, :cond_2

    .line 85
    .line 86
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/K5;->r(Lc1/b;Landroid/view/View;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    iget v2, p0, Lcom/android/launcher3/K5;->j:I

    .line 91
    .line 92
    iget v3, p0, Lcom/android/launcher3/K5;->k:I

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/android/launcher3/K5;->j()Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    iget v5, p0, Lcom/android/launcher3/K5;->m:I

    .line 99
    .line 100
    iget v6, p0, Lcom/android/launcher3/K5;->n:I

    .line 101
    .line 102
    iget-object v7, p0, Lcom/android/launcher3/K5;->l:Landroid/graphics/Point;

    .line 103
    .line 104
    invoke-virtual/range {v1 .. v7}, Lc1/b;->k(IIZIILandroid/graphics/Point;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
