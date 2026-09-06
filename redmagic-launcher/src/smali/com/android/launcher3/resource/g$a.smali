.class Lcom/android/launcher3/resource/g$a;
.super Ljava/lang/Object;
.source "AppsSortInfoManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private a:J

.field private b:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-wide p1, p0, Lcom/android/launcher3/resource/g$a;->a:J

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/resource/g$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/g$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/resource/g$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/resource/g$a;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/resource/g$a;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/resource/g$a;->b:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/resource/g$a;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/launcher3/resource/g$a;->a:J

    .line 2
    .line 3
    return-void
.end method
