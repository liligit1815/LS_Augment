.class public Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;
.super Ljava/lang/Object;
.source "ActiveGestureLog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/ActiveGestureLog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CompoundString"
.end annotation


# static fields
.field public static final NO_OP:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;


# instance fields
.field private final mArgs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mIsNoOp:Z

.field private final mSubstrings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->NO_OP:Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 8
    .line 9
    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 5
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Z)V

    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-boolean p1, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mIsNoOp:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    move-object v1, v0

    goto :goto_0

    .line 3
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    iput-object v1, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mSubstrings:Ljava/util/List;

    if-eqz p1, :cond_1

    goto :goto_1

    .line 4
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_1
    iput-object v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mArgs:Ljava/util/List;

    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mIsNoOp:Z

    .line 2
    .line 3
    return p0
.end method

.method public static newEmptyString()Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public append(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mIsNoOp:Z

    if-nez v0, :cond_1

    iget-boolean v0, p1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mIsNoOp:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mSubstrings:Ljava/util/List;

    iget-object v1, p1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mSubstrings:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 3
    iget-object v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mArgs:Ljava/util/List;

    iget-object p1, p1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mArgs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_1
    :goto_0
    return-object p0
.end method

.method public varargs append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;
    .locals 1

    .line 4
    iget-boolean v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mIsNoOp:Z

    if-eqz v0, :cond_0

    return-object p0

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mSubstrings:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mArgs:Ljava/util/List;

    invoke-static {p2}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mIsNoOp:Z

    .line 9
    .line 10
    iget-boolean v2, p1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mIsNoOp:Z

    .line 11
    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mSubstrings:Ljava/util/List;

    .line 15
    .line 16
    iget-object v2, p1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mSubstrings:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mArgs:Ljava/util/List;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mArgs:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mIsNoOp:Z

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mSubstrings:Ljava/util/List;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mArgs:Ljava/util/List;

    .line 10
    .line 11
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mIsNoOp:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mSubstrings:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->mArgs:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method
