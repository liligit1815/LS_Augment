.class interface abstract Lcom/android/launcher3/anim/q$d;
.super Ljava/lang/Object;
.source "AnimatorPlaybackController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/anim/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "d"
.end annotation


# static fields
.field public static final a:Lcom/android/launcher3/anim/q$d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/r;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/anim/r;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/anim/q$d;->a:Lcom/android/launcher3/anim/q$d;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(FF)F
    .locals 1

    .line 1
    cmpl-float v0, p0, p1

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    const/high16 p0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    div-float/2addr p0, p1

    .line 9
    return p0
.end method


# virtual methods
.method public abstract a(FF)F
.end method
