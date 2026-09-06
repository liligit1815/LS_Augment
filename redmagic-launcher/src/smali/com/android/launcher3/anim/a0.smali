.class public final Lcom/android/launcher3/anim/a0;
.super Ljava/lang/Object;
.source "RemoteAnimInterrupter.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# static fields
.field public static final o:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/anim/a0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private g:I

.field private volatile h:F

.field private i:Landroid/graphics/RectF;

.field private final j:Landroid/os/Handler;

.field private volatile k:F

.field private l:Ljava/lang/Runnable;

.field private m:F

.field private n:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/anim/Z;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/anim/Z;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/anim/a0;->o:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 p1, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput p1, p0, Lcom/android/launcher3/anim/a0;->k:F

    .line 7
    .line 8
    const/high16 p1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    iput p1, p0, Lcom/android/launcher3/anim/a0;->h:F

    .line 11
    .line 12
    iput p1, p0, Lcom/android/launcher3/anim/a0;->m:F

    .line 13
    .line 14
    new-instance p1, Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/launcher3/anim/a0;->i:Landroid/graphics/RectF;

    .line 20
    .line 21
    const/high16 p1, -0x80000000

    .line 22
    .line 23
    iput p1, p0, Lcom/android/launcher3/anim/a0;->n:I

    .line 24
    .line 25
    iput p1, p0, Lcom/android/launcher3/anim/a0;->g:I

    .line 26
    .line 27
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Lcom/android/launcher3/anim/a0$a;

    .line 32
    .line 33
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/anim/a0$a;-><init>(Lcom/android/launcher3/anim/a0;Landroid/os/Looper;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/anim/a0;->j:Landroid/os/Handler;

    .line 37
    .line 38
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/anim/a0;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/a0;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/anim/a0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/a0;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iput v0, p0, Lcom/android/launcher3/anim/a0;->m:F

    .line 4
    .line 5
    return-void
.end method
