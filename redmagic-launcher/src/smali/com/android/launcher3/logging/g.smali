.class public Lcom/android/launcher3/logging/g;
.super Ljava/lang/Object;
.source "KeyboardStateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/logging/g$a;
    }
.end annotation


# instance fields
.field private a:J

.field private b:I

.field private c:Z

.field private d:Lcom/android/launcher3/logging/g$a;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/logging/g$a;->g:Lcom/android/launcher3/logging/g$a;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/logging/g;->d:Lcom/android/launcher3/logging/g$a;

    .line 7
    .line 8
    iput p1, p0, Lcom/android/launcher3/logging/g;->b:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/logging/g$a;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/android/launcher3/logging/g;->a:J

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/logging/g;->d:Lcom/android/launcher3/logging/g$a;

    .line 8
    .line 9
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/logging/g;->c:Z

    .line 2
    .line 3
    return-void
.end method
