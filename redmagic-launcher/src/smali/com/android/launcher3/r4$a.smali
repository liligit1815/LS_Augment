.class Lcom/android/launcher3/r4$a;
.super Ljava/lang/Object;
.source "MFVInvariantDeviceProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/r4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field a:F


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/r4$a;->a:F

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method a(Lcom/android/launcher3/r4$a;)Lcom/android/launcher3/r4$a;
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/r4$a;->a:F

    .line 2
    .line 3
    iget p1, p1, Lcom/android/launcher3/r4$a;->a:F

    .line 4
    .line 5
    add-float/2addr v0, p1

    .line 6
    iput v0, p0, Lcom/android/launcher3/r4$a;->a:F

    .line 7
    .line 8
    return-object p0
.end method

.method b(F)Lcom/android/launcher3/r4$a;
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/r4$a;->a:F

    .line 2
    .line 3
    mul-float/2addr v0, p1

    .line 4
    iput v0, p0, Lcom/android/launcher3/r4$a;->a:F

    .line 5
    .line 6
    return-object p0
.end method
