.class public final Lcom/android/quickstep/util/anim/ResultObject;
.super Ljava/lang/Object;
.source "ResultObject.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/anim/ResultObject$Failure;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field public final obj:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/anim/ResultObject;->obj:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method

.method public static final getFailueThrowable(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/quickstep/util/anim/ResultObject$Failure;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/quickstep/util/anim/ResultObject$Failure;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/util/anim/ResultObject$Failure;->throwable:Ljava/lang/Throwable;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public static final m10622c(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/quickstep/util/anim/ResultObject$Failure;

    .line 2
    .line 3
    return p0
.end method

.method public static final newResult(Ljava/lang/Object;)Lcom/android/quickstep/util/anim/ResultObject;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/anim/ResultObject;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/anim/ResultObject;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/quickstep/util/anim/ResultObject;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/util/anim/ResultObject;->obj:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/android/quickstep/util/anim/ResultObject;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/android/quickstep/util/anim/ResultObject;->obj:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/anim/ResultObject;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/anim/ResultObject;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/quickstep/util/anim/ResultObject$Failure;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/android/quickstep/util/anim/ResultObject$Failure;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/util/anim/ResultObject$Failure;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "Success("

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const/16 p0, 0x29

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method
