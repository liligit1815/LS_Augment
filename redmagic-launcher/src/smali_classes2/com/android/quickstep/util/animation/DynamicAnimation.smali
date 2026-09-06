.class public abstract Lcom/android/quickstep/util/animation/DynamicAnimation;
.super Ljava/lang/Object;
.source "DynamicAnimation.java"

# interfaces
.implements Landroid/animation/AnimationHandler$AnimationFrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;,
        Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;,
        Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;,
        Lcom/android/quickstep/util/animation/DynamicAnimation$MassState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/quickstep/util/animation/DynamicAnimation<",
        "TT;>;>",
        "Ljava/lang/Object;",
        "Landroid/animation/AnimationHandler$AnimationFrameCallback;"
    }
.end annotation


# static fields
.field public static final ALPHA:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final MIN_VISIBLE_CHANGE_ALPHA:F = 0.00390625f
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MinMaxConstant"
        }
    .end annotation
.end field

.field public static final MIN_VISIBLE_CHANGE_PIXELS:F = 1.0f
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MinMaxConstant"
        }
    .end annotation
.end field

.field public static final MIN_VISIBLE_CHANGE_ROTATION_DEGREES:F = 0.1f
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MinMaxConstant"
        }
    .end annotation
.end field

.field public static final MIN_VISIBLE_CHANGE_SCALE:F = 0.002f
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MinMaxConstant"
        }
    .end annotation
.end field

.field public static final ROTATION:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final ROTATION_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final ROTATION_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final SCALE_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final SCALE_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final SCROLL_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final SCROLL_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field private static final TAG:Ljava/lang/String; = "DynamicAnimation"

.field private static final THRESHOLD_MULTIPLIER:F = 0.75f

.field public static final TRANSLATION_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final TRANSLATION_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final TRANSLATION_Z:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field private static final UNSET:F = 3.4028235E38f

.field public static final f5369X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final f5370Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

.field public static final f5371Z:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;


# instance fields
.field private mAnimationHandler:Landroid/animation/AnimationHandler;

.field private final mEndListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;",
            ">;"
        }
    .end annotation
.end field

.field private mLastFrameTime:J

.field mMaxValue:F

.field mMinValue:F

.field private mMinVisibleChange:F

.field final mProperty:Landroid/util/FloatProperty;

.field mRunning:Z

.field mStartValueIsSet:Z

.field final mTarget:Ljava/lang/Object;

.field private final mUpdateListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;",
            ">;"
        }
    .end annotation
.end field

.field mValue:F

.field mVelocity:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$1;

    .line 2
    .line 3
    const-string v1, "translationX"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->TRANSLATION_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$2;

    .line 11
    .line 12
    const-string v1, "translationY"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$2;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->TRANSLATION_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 18
    .line 19
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$3;

    .line 20
    .line 21
    const-string v1, "translationZ"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$3;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->TRANSLATION_Z:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 27
    .line 28
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$4;

    .line 29
    .line 30
    const-string v1, "scaleX"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$4;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->SCALE_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 36
    .line 37
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$5;

    .line 38
    .line 39
    const-string v1, "scaleY"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$5;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->SCALE_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 45
    .line 46
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$6;

    .line 47
    .line 48
    const-string v1, "rotation"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$6;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->ROTATION:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 54
    .line 55
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$7;

    .line 56
    .line 57
    const-string v1, "rotationX"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$7;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->ROTATION_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 63
    .line 64
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$8;

    .line 65
    .line 66
    const-string v1, "rotationY"

    .line 67
    .line 68
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$8;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->ROTATION_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 72
    .line 73
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$9;

    .line 74
    .line 75
    const-string v1, "x"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$9;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->f5369X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 81
    .line 82
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$10;

    .line 83
    .line 84
    const-string v1, "y"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$10;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->f5370Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 90
    .line 91
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$11;

    .line 92
    .line 93
    const-string v1, "z"

    .line 94
    .line 95
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$11;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->f5371Z:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 99
    .line 100
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$12;

    .line 101
    .line 102
    const-string v1, "alpha"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$12;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->ALPHA:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 108
    .line 109
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$13;

    .line 110
    .line 111
    const-string v1, "scrollX"

    .line 112
    .line 113
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$13;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->SCROLL_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 117
    .line 118
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$14;

    .line 119
    .line 120
    const-string v1, "scrollY"

    .line 121
    .line 122
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/animation/DynamicAnimation$14;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    sput-object v0, Lcom/android/quickstep/util/animation/DynamicAnimation;->SCROLL_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    .line 126
    .line 127
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/util/animation/FloatValueHolder;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 3
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mStartValueIsSet:Z

    .line 5
    iput-boolean v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mRunning:Z

    .line 6
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMaxValue:F

    const v0, -0x800001

    .line 7
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinValue:F

    const-wide/16 v0, 0x0

    .line 8
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mLastFrameTime:J

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mTarget:Ljava/lang/Object;

    .line 12
    new-instance v0, Lcom/android/quickstep/util/animation/DynamicAnimation$15;

    const-string v1, "FloatValueHolder"

    invoke-direct {v0, p0, v1, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation$15;-><init>(Lcom/android/quickstep/util/animation/DynamicAnimation;Ljava/lang/String;Lcom/android/quickstep/util/animation/FloatValueHolder;)V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mProperty:Landroid/util/FloatProperty;

    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinVisibleChange:F

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Landroid/util/FloatProperty;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Landroid/util/FloatProperty<",
            "TK;>;)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 16
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    const/4 v1, 0x0

    .line 17
    iput-boolean v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mStartValueIsSet:Z

    .line 18
    iput-boolean v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mRunning:Z

    .line 19
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMaxValue:F

    const v0, -0x800001

    .line 20
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinValue:F

    const-wide/16 v0, 0x0

    .line 21
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mLastFrameTime:J

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 24
    iput-object p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mTarget:Ljava/lang/Object;

    .line 25
    iput-object p2, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mProperty:Landroid/util/FloatProperty;

    .line 26
    sget-object p1, Lcom/android/quickstep/util/animation/DynamicAnimation;->ROTATION:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    if-eq p2, p1, :cond_2

    sget-object p1, Lcom/android/quickstep/util/animation/DynamicAnimation;->ROTATION_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    if-eq p2, p1, :cond_2

    sget-object p1, Lcom/android/quickstep/util/animation/DynamicAnimation;->ROTATION_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    if-eq p2, p1, :cond_2

    .line 27
    sget-object p1, Lcom/android/quickstep/util/animation/DynamicAnimation;->ALPHA:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    if-ne p2, p1, :cond_0

    const/high16 p1, 0x3b800000    # 0.00390625f

    .line 28
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinVisibleChange:F

    return-void

    .line 29
    :cond_0
    sget-object p1, Lcom/android/quickstep/util/animation/DynamicAnimation;->SCALE_X:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    if-eq p2, p1, :cond_1

    sget-object p1, Lcom/android/quickstep/util/animation/DynamicAnimation;->SCALE_Y:Lcom/android/quickstep/util/animation/DynamicAnimation$ViewProperty;

    if-eq p2, p1, :cond_1

    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinVisibleChange:F

    return-void

    :cond_1
    const p1, 0x3b03126f    # 0.002f

    .line 31
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinVisibleChange:F

    return-void

    :cond_2
    const p1, 0x3dcccccd    # 0.1f

    .line 32
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinVisibleChange:F

    return-void
.end method

.method private endAnimationInternal(Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mRunning:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->getAnimationHandler()Landroid/animation/AnimationHandler;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, p0}, Landroid/animation/AnimationHandler;->removeCallback(Landroid/animation/AnimationHandler$AnimationFrameCallback;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    iput-wide v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mLastFrameTime:J

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mStartValueIsSet:Z

    .line 16
    .line 17
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ge v0, v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

    .line 40
    .line 41
    iget v2, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 42
    .line 43
    iget v3, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 44
    .line 45
    invoke-interface {v1, p0, p1, v2, v3}, Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;->onAnimationEnd(Lcom/android/quickstep/util/animation/DynamicAnimation;ZFF)V

    .line 46
    .line 47
    .line 48
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-static {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeNullEntries(Ljava/util/ArrayList;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private getPropertyValue()F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mProperty:Landroid/util/FloatProperty;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mTarget:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Float;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private static removeEntry(Ljava/util/ArrayList;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private static removeNullEntries(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return-void
.end method

.method private startAnimationInternal()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mRunning:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mRunning:Z

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mStartValueIsSet:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->getPropertyValue()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 18
    .line 19
    :cond_1
    iget v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 20
    .line 21
    iget v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMaxValue:F

    .line 22
    .line 23
    cmpl-float v1, v0, v1

    .line 24
    .line 25
    if-gtz v1, :cond_2

    .line 26
    .line 27
    iget v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinValue:F

    .line 28
    .line 29
    cmpg-float v0, v0, v1

    .line 30
    .line 31
    if-ltz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->getAnimationHandler()Landroid/animation/AnimationHandler;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-wide/16 v1, 0x0

    .line 38
    .line 39
    invoke-virtual {v0, p0, v1, v2}, Landroid/animation/AnimationHandler;->addAnimationFrameCallback(Landroid/animation/AnimationHandler$AnimationFrameCallback;J)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 44
    .line 45
    const-string v0, "Starting value need to be in between min value and max value"

    .line 46
    .line 47
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw p0
.end method


# virtual methods
.method public addEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)Lcom/android/quickstep/util/animation/DynamicAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method public addUpdateListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;)Lcom/android/quickstep/util/animation/DynamicAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object p0

    .line 21
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 22
    .line 23
    const-string p1, "Error: Update listeners must be added beforethe animation."

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0
.end method

.method public cancel()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isCurrentThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mRunning:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->endAnimationInternal(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void

    .line 16
    :cond_1
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 17
    .line 18
    const-string v0, "Animations may only be canceled from the same thread as the animation handler"

    .line 19
    .line 20
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0
.end method

.method public commitAnimationFrame(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/animation/DynamicAnimation;->doAnimationFrame(J)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public doAnimationFrame(J)Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mLastFrameTime:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mLastFrameTime:J

    .line 11
    .line 12
    iget p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setPropertyValue(F)V

    .line 15
    .line 16
    .line 17
    return v3

    .line 18
    :cond_0
    sub-long/2addr p1, v0

    .line 19
    add-long/2addr v0, p1

    .line 20
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mLastFrameTime:J

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/animation/DynamicAnimation;->updateValueAndVelocity(J)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget p2, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 27
    .line 28
    iget v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMaxValue:F

    .line 29
    .line 30
    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iput p2, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 35
    .line 36
    iget v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinValue:F

    .line 37
    .line 38
    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iput p2, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 43
    .line 44
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setPropertyValue(F)V

    .line 45
    .line 46
    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    invoke-direct {p0, v3}, Lcom/android/quickstep/util/animation/DynamicAnimation;->endAnimationInternal(Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return p1
.end method

.method public abstract getAcceleration(FF)F
.end method

.method public getAnimationHandler()Landroid/animation/AnimationHandler;
    .locals 0
    .annotation build Landroid/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mAnimationHandler:Landroid/animation/AnimationHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {}, Landroid/animation/AnimationHandler;->getInstance()Landroid/animation/AnimationHandler;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getMinimumVisibleChange()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinVisibleChange:F

    .line 2
    .line 3
    return p0
.end method

.method public getValueThreshold()F
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinVisibleChange:F

    .line 2
    .line 3
    const/high16 v0, 0x3f400000    # 0.75f

    .line 4
    .line 5
    mul-float/2addr p0, v0

    .line 6
    return p0
.end method

.method public abstract isAtEquilibrium(FF)Z
.end method

.method public isCurrentThread()Z
    .locals 1

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-ne p0, v0, :cond_0

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

.method public isRunning()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mRunning:Z

    .line 2
    .line 3
    return p0
.end method

.method public removeEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeEntry(Ljava/util/ArrayList;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeUpdateListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeEntry(Ljava/util/ArrayList;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMaxValue(F)Lcom/android/quickstep/util/animation/DynamicAnimation;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMaxValue:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setMinValue(F)Lcom/android/quickstep/util/animation/DynamicAnimation;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinValue:F

    .line 2
    .line 3
    return-object p0
.end method

.method public setMinimumVisibleChange(F)Lcom/android/quickstep/util/animation/DynamicAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mMinVisibleChange:F

    .line 7
    .line 8
    const/high16 v0, 0x3f400000    # 0.75f

    .line 9
    .line 10
    mul-float/2addr p1, v0

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->setValueThreshold(F)V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 16
    .line 17
    const-string p1, "Minimum visible change must be positive."

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    throw p0
.end method

.method public setPropertyValue(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mProperty:Landroid/util/FloatProperty;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mTarget:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-ge p1, v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;

    .line 32
    .line 33
    iget v1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 34
    .line 35
    iget v2, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 36
    .line 37
    invoke-interface {v0, p0, v1, v2}, Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationUpdateListener;->onAnimationUpdate(Lcom/android/quickstep/util/animation/DynamicAnimation;FF)V

    .line 38
    .line 39
    .line 40
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeNullEntries(Ljava/util/ArrayList;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public setStartValue(F)Lcom/android/quickstep/util/animation/DynamicAnimation;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mValue:F

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mStartValueIsSet:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public setStartVelocity(F)Lcom/android/quickstep/util/animation/DynamicAnimation;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mVelocity:F

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract setValueThreshold(F)V
.end method

.method public start()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isCurrentThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation;->mRunning:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->startAnimationInternal()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 17
    .line 18
    const-string v0, "Animations may only be started on the same thread as the animation handler"

    .line 19
    .line 20
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0
.end method

.method public abstract updateValueAndVelocity(J)Z
.end method
