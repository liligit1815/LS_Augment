.class public final Lcom/android/quickstep/util/animation/AnimationRecord;
.super Ljava/lang/Object;
.source "AnimationRecord.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/animation/AnimationRecord$Companion;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/util/animation/AnimationRecord$Companion;

.field public static final INVALID_ANIMATION_ID:I = -0x1

.field public static final MAX_ANIMATION_ID:I = 0x2710

.field public static final MULTI_USER_ID:I = 0x3e7

.field private static final TAG:Ljava/lang/String; = "AnimationRecord"

.field public static sAnimationId:I


# instance fields
.field private mAnimationId:I

.field private mAppLocationType:LN0/a;

.field private mComponentNameStr:Ljava/lang/String;

.field private mIconLayerHolder:LU0/c;

.field private mIconLayerReleased:Z

.field private mIconLayerReusing:Z

.field private mIconViewFounded:Z

.field private mIsBigFolderItem:Z

.field private mIsClipFromLeftOrTop:Z

.field private mIsCloneApp:Z

.field private mIsGroupChildCard:Z

.field private mIsVerticalClip:Z

.field private mItemType:I

.field private mMultiAnimatorSet:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

.field private mPackageName:Ljava/lang/String;

.field private mTaskId:I

.field private mViewInfoId:I

.field private mViewPosition:Landroid/graphics/Point;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/AnimationRecord$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/AnimationRecord$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/animation/AnimationRecord;->INSTANCE:Lcom/android/quickstep/util/animation/AnimationRecord$Companion;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    sput v0, Lcom/android/quickstep/util/animation/AnimationRecord;->sAnimationId:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;[Lu2/s;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "multiAnimatorSet"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "appTargets"

    .line 10
    .line 11
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    iput v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAnimationId:I

    .line 16
    .line 17
    const/high16 v1, -0x80000000

    .line 18
    .line 19
    iput v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mTaskId:I

    .line 20
    .line 21
    iput v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewInfoId:I

    .line 22
    .line 23
    new-instance v1, Landroid/graphics/Point;

    .line 24
    .line 25
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewPosition:Landroid/graphics/Point;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    iput-boolean v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsVerticalClip:Z

    .line 32
    .line 33
    iput v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mItemType:I

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    if-eqz p3, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v1, v0

    .line 40
    :goto_0
    iput-boolean v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconViewFounded:Z

    .line 41
    .line 42
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/AnimationRecord;->createAnimationId()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iput v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAnimationId:I

    .line 47
    .line 48
    new-instance v2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v3, "Create animation record, id: "

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, ", type: "

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const-string v2, "AnimationRecord"

    .line 78
    .line 79
    invoke-static {v2, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsBigFolderItem:Z

    .line 83
    .line 84
    invoke-static {p3}, Lb1/a;->a(Landroid/view/View;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    iput-boolean v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsGroupChildCard:Z

    .line 89
    .line 90
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mMultiAnimatorSet:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 91
    .line 92
    iget v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAnimationId:I

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->setAnimationId(I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->isAppOpenType()Z

    .line 98
    .line 99
    .line 100
    array-length p1, p2

    .line 101
    move v1, v0

    .line 102
    :goto_1
    if-ge v1, p1, :cond_1

    .line 103
    .line 104
    aget-object v2, p2, v1

    .line 105
    .line 106
    add-int/lit8 v1, v1, 0x1

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_1
    if-eqz p3, :cond_4

    .line 110
    .line 111
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    instance-of p1, p1, Lcom/android/launcher3/model/data/y;

    .line 116
    .line 117
    if-nez p1, :cond_2

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_2
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    const-string p2, "null cannot be cast to non-null type com.android.launcher3.model.data.ItemInfo"

    .line 125
    .line 126
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 130
    .line 131
    sget-object p2, LN0/a;->g:LN0/a;

    .line 132
    .line 133
    iput-object p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAppLocationType:LN0/a;

    .line 134
    .line 135
    iget p2, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 136
    .line 137
    iput p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewInfoId:I

    .line 138
    .line 139
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsCloneApp:Z

    .line 140
    .line 141
    iget-object p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewPosition:Landroid/graphics/Point;

    .line 142
    .line 143
    iget p3, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 144
    .line 145
    iput p3, p2, Landroid/graphics/Point;->x:I

    .line 146
    .line 147
    iget p3, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 148
    .line 149
    iput p3, p2, Landroid/graphics/Point;->y:I

    .line 150
    .line 151
    iget p2, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 152
    .line 153
    iput p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mItemType:I

    .line 154
    .line 155
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    if-eqz p2, :cond_3

    .line 160
    .line 161
    invoke-virtual {p2}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    goto :goto_2

    .line 166
    :cond_3
    const/4 p2, 0x0

    .line 167
    :goto_2
    iput-object p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mComponentNameStr:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mPackageName:Ljava/lang/String;

    .line 174
    .line 175
    :cond_4
    :goto_3
    return-void
.end method

.method private final createAnimationId()I
    .locals 1

    .line 1
    sget p0, Lcom/android/quickstep/util/animation/AnimationRecord;->sAnimationId:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    sput p0, Lcom/android/quickstep/util/animation/AnimationRecord;->sAnimationId:I

    .line 6
    .line 7
    const/16 v0, 0x2710

    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, -0x1

    .line 13
    sput p0, Lcom/android/quickstep/util/animation/AnimationRecord;->sAnimationId:I

    .line 14
    .line 15
    return v0
.end method

.method private final isGestureToDragAnim()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mMultiAnimatorSet:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->GESTURE_TO_DRAG:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

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

.method private final isIconLayerValid()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerReleased:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public static final isOpenAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/AnimationRecord;->INSTANCE:Lcom/android/quickstep/util/animation/AnimationRecord$Companion;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/animation/AnimationRecord$Companion;->isOpenAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private final isSameAppIcon(Lcom/android/quickstep/util/animation/AnimationRecord;Lcom/android/launcher3/C2;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p2, :cond_1

    .line 3
    .line 4
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 5
    .line 6
    invoke-interface {p2, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    iget-boolean p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsCloneApp:Z

    .line 13
    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewInfoId:I

    .line 18
    .line 19
    iget v1, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewInfoId:I

    .line 20
    .line 21
    if-ne p2, v1, :cond_3

    .line 22
    .line 23
    iget-object p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewPosition:Landroid/graphics/Point;

    .line 24
    .line 25
    iget v1, p2, Landroid/graphics/Point;->x:I

    .line 26
    .line 27
    iget-object v2, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewPosition:Landroid/graphics/Point;

    .line 28
    .line 29
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 30
    .line 31
    if-ne v1, v3, :cond_3

    .line 32
    .line 33
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 34
    .line 35
    iget v1, v2, Landroid/graphics/Point;->y:I

    .line 36
    .line 37
    if-ne p2, v1, :cond_3

    .line 38
    .line 39
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->matchComponent(Lcom/android/quickstep/util/animation/AnimationRecord;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_3

    .line 44
    .line 45
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsBigFolderItem:Z

    .line 46
    .line 47
    iget-boolean p1, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsBigFolderItem:Z

    .line 48
    .line 49
    if-ne p0, p1, :cond_3

    .line 50
    .line 51
    return v0

    .line 52
    :cond_1
    :goto_0
    iget p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewInfoId:I

    .line 53
    .line 54
    const/4 v1, -0x1

    .line 55
    if-ne p2, v1, :cond_2

    .line 56
    .line 57
    iget v2, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewInfoId:I

    .line 58
    .line 59
    if-eq v2, v1, :cond_3

    .line 60
    .line 61
    :cond_2
    iget v1, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewInfoId:I

    .line 62
    .line 63
    if-ne p2, v1, :cond_3

    .line 64
    .line 65
    iget-object p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewPosition:Landroid/graphics/Point;

    .line 66
    .line 67
    iget v1, p2, Landroid/graphics/Point;->x:I

    .line 68
    .line 69
    iget-object v2, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewPosition:Landroid/graphics/Point;

    .line 70
    .line 71
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 72
    .line 73
    if-ne v1, v3, :cond_3

    .line 74
    .line 75
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 76
    .line 77
    iget v1, v2, Landroid/graphics/Point;->y:I

    .line 78
    .line 79
    if-ne p2, v1, :cond_3

    .line 80
    .line 81
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->matchComponent(Lcom/android/quickstep/util/animation/AnimationRecord;)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-eqz p2, :cond_3

    .line 86
    .line 87
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsBigFolderItem:Z

    .line 88
    .line 89
    iget-boolean p1, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsBigFolderItem:Z

    .line 90
    .line 91
    if-ne p0, p1, :cond_3

    .line 92
    .line 93
    return v0

    .line 94
    :cond_3
    const/4 p0, 0x0

    .line 95
    return p0
.end method

.method private final matchComponent(Lcom/android/quickstep/util/animation/AnimationRecord;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mComponentNameStr:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mComponentNameStr:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mComponentNameStr:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mComponentNameStr:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 28
    return p0
.end method


# virtual methods
.method public final canReuseIconLayer(Lcom/android/quickstep/util/animation/AnimationRecord;Lcom/android/launcher3/C2;)Z
    .locals 2

    .line 1
    const-string v0, "lastAnimRecord"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/animation/AnimationRecord;->isSameAppIcon(Lcom/android/quickstep/util/animation/AnimationRecord;Lcom/android/launcher3/C2;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-direct {p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->isIconLayerValid()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    iget-object p2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAppLocationType:LN0/a;

    .line 19
    .line 20
    iget-object v0, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mAppLocationType:LN0/a;

    .line 21
    .line 22
    if-ne p2, v0, :cond_0

    .line 23
    .line 24
    const/4 p2, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p2, 0x0

    .line 27
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "canReuseIconLayer: "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, ", appLt: "

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAppLocationType:LN0/a;

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p0, ", oldAppLt: "

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Lcom/android/quickstep/util/animation/AnimationRecord;->mAppLocationType:LN0/a;

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "AnimationRecord"

    .line 65
    .line 66
    invoke-static {p1, p0}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return p2
.end method

.method public final getMAnimationId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAnimationId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMIconLayerHolder()LU0/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerHolder:LU0/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMIsClipFromLeftOrTop()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsClipFromLeftOrTop:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMIsVerticalClip()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsVerticalClip:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMItemType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mItemType:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mMultiAnimatorSet:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMTaskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mTaskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final isRectFSpringAnimRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mMultiAnimatorSet:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMAnimStarted()Z

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

.method public final releaseIconLayerIfNeeded(I)Z
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerReusing:Z

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerReleased:Z

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAnimationId:I

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mMultiAnimatorSet:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 8
    .line 9
    invoke-virtual {v3}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-object v4, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mComponentNameStr:Ljava/lang/String;

    .line 14
    .line 15
    const-string v5, ",mIconLayerReleased: "

    .line 16
    .line 17
    const-string v6, ",curAnimId: "

    .line 18
    .line 19
    const-string v7, "releaseIconLayerIfNeeded, mIconLayerReusing: "

    .line 20
    .line 21
    invoke-static {v7, v0, v5, v1, v6}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, ", requestAnimId: "

    .line 26
    .line 27
    const-string v5, " type: "

    .line 28
    .line 29
    invoke-static {v0, v2, v1, p1, v5}, Lcom/android/quickstep/util/MFVStringUtils;->appendToStringBuilder(Ljava/lang/StringBuilder;ILjava/lang/String;ILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, " app: "

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "AnimationRecord"

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerReleased:Z

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    return v1

    .line 58
    :cond_0
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerReusing:Z

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 64
    .line 65
    iget v3, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAnimationId:I

    .line 66
    .line 67
    invoke-virtual {v0, v3, p1}, Lcom/android/quickstep/utils/MFVAnimManager;->matchAnimationId(II)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerHolder:LU0/c;

    .line 75
    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mMultiAnimatorSet:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->isAppOpenType()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-virtual {p1, v0, v2}, LU0/c;->b(ZZ)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    move v2, v1

    .line 91
    :cond_2
    iput-boolean v2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerReleased:Z

    .line 92
    .line 93
    return v1

    .line 94
    :cond_3
    :goto_0
    return v2
.end method

.method public final setIconLayerHolder(LU0/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerHolder:LU0/c;

    .line 2
    .line 3
    return-void
.end method

.method public final setMIsClipFromLeftOrTop(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsClipFromLeftOrTop:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setMIsVerticalClip(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsVerticalClip:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setMItemType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mItemType:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mAnimationId:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mTaskId:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mViewInfoId:I

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsCloneApp:Z

    .line 8
    .line 9
    const-string v3, ", mTaskId="

    .line 10
    .line 11
    const-string v4, ", mViewInfoId="

    .line 12
    .line 13
    const-string v5, "AnimationRecord(mAnimationId="

    .line 14
    .line 15
    invoke-static {v5, v0, v3, v1, v4}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, ",+ mIsCloneApp="

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, " +"

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final tryConnectExistingAnim(Lcom/android/quickstep/util/animation/AnimationRecord;Landroid/graphics/RectF;FLcom/android/launcher3/C2;)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p4

    .line 8
    .line 9
    const-string v4, "newTargetRectF"

    .line 10
    .line 11
    invoke-static {v2, v4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    const-string v5, "AnimationRecord"

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    const-string v0, "Cannot connect anim as no existing anim record"

    .line 20
    .line 21
    invoke-static {v5, v0}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object v4

    .line 25
    :cond_0
    iget-object v6, v1, Lcom/android/quickstep/util/animation/AnimationRecord;->mMultiAnimatorSet:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 26
    .line 27
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    if-eqz v7, :cond_c

    .line 32
    .line 33
    invoke-virtual {v7}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMAnimStarted()Z

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    if-nez v7, :cond_1

    .line 38
    .line 39
    goto/16 :goto_6

    .line 40
    .line 41
    :cond_1
    invoke-direct {v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->isGestureToDragAnim()Z

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    const/4 v8, 0x1

    .line 46
    const/4 v9, 0x0

    .line 47
    if-nez v7, :cond_3

    .line 48
    .line 49
    invoke-direct {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->isGestureToDragAnim()Z

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-eqz v7, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    move v7, v9

    .line 57
    goto :goto_1

    .line 58
    :cond_3
    :goto_0
    move v7, v8

    .line 59
    :goto_1
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 60
    .line 61
    .line 62
    move-result-object v10

    .line 63
    invoke-virtual {v10}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->isAppOpenType()Z

    .line 64
    .line 65
    .line 66
    move-result v10

    .line 67
    if-eqz v10, :cond_4

    .line 68
    .line 69
    iget-object v10, v0, Lcom/android/quickstep/util/animation/AnimationRecord;->mMultiAnimatorSet:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 70
    .line 71
    invoke-virtual {v10}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 72
    .line 73
    .line 74
    move-result-object v10

    .line 75
    sget-object v11, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->SWIPE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 76
    .line 77
    if-ne v10, v11, :cond_4

    .line 78
    .line 79
    move v10, v8

    .line 80
    goto :goto_2

    .line 81
    :cond_4
    move v10, v9

    .line 82
    :goto_2
    if-nez v7, :cond_6

    .line 83
    .line 84
    if-eqz v10, :cond_5

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_5
    move v11, v9

    .line 88
    goto :goto_4

    .line 89
    :cond_6
    :goto_3
    move v11, v8

    .line 90
    :goto_4
    invoke-direct {v0, v1, v3}, Lcom/android/quickstep/util/animation/AnimationRecord;->isSameAppIcon(Lcom/android/quickstep/util/animation/AnimationRecord;Lcom/android/launcher3/C2;)Z

    .line 91
    .line 92
    .line 93
    move-result v12

    .line 94
    const-string v13, ", openBreakByGestureToHome: "

    .line 95
    .line 96
    const-string v14, ", isSameAppIcon: "

    .line 97
    .line 98
    const-string v15, "hasGestureToDragAnim: "

    .line 99
    .line 100
    invoke-static {v15, v7, v13, v10, v14}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    invoke-static {v7, v12, v5}, Lcom/android/quickstep/util/MFVStringUtils;->appendAndLog(Ljava/lang/StringBuilder;ZLjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    if-nez v11, :cond_7

    .line 108
    .line 109
    if-nez v12, :cond_7

    .line 110
    .line 111
    const-string v0, "Cannot connect anim as different app"

    .line 112
    .line 113
    invoke-static {v5, v0}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->cancelAllAnimExceptSpringAnim()V

    .line 117
    .line 118
    .line 119
    return-object v4

    .line 120
    :cond_7
    const-string v7, "Connect existing animation"

    .line 121
    .line 122
    invoke-static {v5, v7}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v1, v3}, Lcom/android/quickstep/util/animation/AnimationRecord;->canReuseIconLayer(Lcom/android/quickstep/util/animation/AnimationRecord;Lcom/android/launcher3/C2;)Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-eqz v3, :cond_b

    .line 130
    .line 131
    iput-boolean v8, v1, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerReusing:Z

    .line 132
    .line 133
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMIconLayerHolder()LU0/c;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v0, v3}, Lcom/android/quickstep/util/animation/AnimationRecord;->setIconLayerHolder(LU0/c;)V

    .line 138
    .line 139
    .line 140
    iget-object v3, v0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIconLayerHolder:LU0/c;

    .line 141
    .line 142
    if-eqz v3, :cond_8

    .line 143
    .line 144
    invoke-virtual {v3}, LU0/c;->h()V

    .line 145
    .line 146
    .line 147
    :cond_8
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMIconLayerHolder()LU0/c;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    if-eqz v5, :cond_9

    .line 159
    .line 160
    invoke-virtual {v5}, LU0/c;->c()Lcom/android/launcher3/views/FloatingIconView;

    .line 161
    .line 162
    .line 163
    move-result-object v5

    .line 164
    goto :goto_5

    .line 165
    :cond_9
    move-object v5, v4

    .line 166
    :goto_5
    if-eqz v5, :cond_a

    .line 167
    .line 168
    invoke-virtual {v5, v9}, Lcom/android/launcher3/views/FloatingIconView;->t(Z)Lcom/android/launcher3/anim/U;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    :cond_a
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->removeAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 173
    .line 174
    .line 175
    :cond_b
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    move/from16 v4, p3

    .line 183
    .line 184
    invoke-virtual {v3, v2, v4}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->copyNextAnimState(Landroid/graphics/RectF;F)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->cancelAllAnimExceptSpringAnim()V

    .line 189
    .line 190
    .line 191
    iget-boolean v3, v1, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsVerticalClip:Z

    .line 192
    .line 193
    iput-boolean v3, v0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsVerticalClip:Z

    .line 194
    .line 195
    iget-boolean v1, v1, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsClipFromLeftOrTop:Z

    .line 196
    .line 197
    iput-boolean v1, v0, Lcom/android/quickstep/util/animation/AnimationRecord;->mIsClipFromLeftOrTop:Z

    .line 198
    .line 199
    return-object v2

    .line 200
    :cond_c
    :goto_6
    const-string v0, "Cannot connect anim as no running window anim"

    .line 201
    .line 202
    invoke-static {v5, v0}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    return-object v4
.end method
