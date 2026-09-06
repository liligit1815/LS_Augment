.class public final Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2;
.super Ljava/lang/Object;
.source "Emitters.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LI4/e;"
    }
.end annotation


# instance fields
.field final synthetic $this_unsafeFlow:LI4/e;


# direct methods
.method public constructor <init>(LI4/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2;->$this_unsafeFlow:LI4/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 12

    .line 1
    instance-of v0, p2, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2$1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2$1;

    .line 7
    .line 8
    iget v1, v0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2$1;->label:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2$1;->label:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2$1;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2$1;-><init>(Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2$1;->result:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2$1;->label:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 43
    .line 44
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 45
    .line 46
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :cond_2
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2;->$this_unsafeFlow:LI4/e;

    .line 54
    .line 55
    check-cast p1, Lcom/android/systemui/shared/recents/model/Task;

    .line 56
    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    new-instance v4, Lcom/android/quickstep/recents/domain/model/TaskModel;

    .line 60
    .line 61
    iget-object p2, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 62
    .line 63
    iget v5, p2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 64
    .line 65
    iget-object v6, p1, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v7, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v8, p1, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    iget-object v9, p1, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 72
    .line 73
    iget v10, p1, Lcom/android/systemui/shared/recents/model/Task;->colorBackground:I

    .line 74
    .line 75
    iget-boolean v11, p1, Lcom/android/systemui/shared/recents/model/Task;->isLocked:Z

    .line 76
    .line 77
    invoke-direct/range {v4 .. v11}, Lcom/android/quickstep/recents/domain/model/TaskModel;-><init>(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Lcom/android/systemui/shared/recents/model/ThumbnailData;IZ)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_3
    const/4 v4, 0x0

    .line 82
    :goto_1
    iput v3, v0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1$2$1;->label:I

    .line 83
    .line 84
    invoke-interface {p0, v4, v0}, LI4/e;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    if-ne p0, v1, :cond_4

    .line 89
    .line 90
    return-object v1

    .line 91
    :cond_4
    :goto_2
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 92
    .line 93
    return-object p0
.end method
