.class public final Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1$2;
.super Ljava/lang/Object;
.source "Zip.kt"

# interfaces
.implements Lu4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lu4/a<",
        "[",
        "Lh4/l<",
        "+",
        "Ljava/lang/Integer;",
        "+",
        "Lcom/android/quickstep/recents/domain/model/TaskModel;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic $flowArray:[LI4/d;


# direct methods
.method public constructor <init>([LI4/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1$2;->$flowArray:[LI4/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1$2;->invoke()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()[Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lh4/l<",
            "+",
            "Ljava/lang/Integer;",
            "+",
            "Lcom/android/quickstep/recents/domain/model/TaskModel;",
            ">;"
        }
    .end annotation

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1$2;->$flowArray:[LI4/d;

    array-length p0, p0

    new-array p0, p0, [Lh4/l;

    return-object p0
.end method
