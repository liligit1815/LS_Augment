.class public final Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;
.super Ljava/lang/Object;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ColorResources"
.end annotation


# static fields
.field private static final ARSC_ENTRY_SIZE:I = 0x10

.field private static final FIRST_RESOURCE_COLOR_ID:I = 0x106001d

.field private static final LAST_RESOURCE_COLOR_ID:I = 0x10600d1


# instance fields
.field private final mColorMapping:Landroid/util/SparseIntArray;

.field private final mLoader:Landroid/content/res/loader/ResourcesLoader;


# direct methods
.method private constructor <init>(Landroid/content/res/loader/ResourcesLoader;Landroid/util/SparseIntArray;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;->mLoader:Landroid/content/res/loader/ResourcesLoader;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;->mColorMapping:Landroid/util/SparseIntArray;

    .line 7
    .line 8
    return-void
.end method

.method public static create(Landroid/content/Context;Landroid/util/SparseIntArray;)Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;->createCompiledResourcesContent(Landroid/content/Context;Landroid/util/SparseIntArray;)[B

    .line 3
    .line 4
    .line 5
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    :try_start_1
    const-string v1, "remote_views_theme_colors.arsc"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v1, v2}, Landroid/system/Os;->memfd_create(Ljava/lang/String;I)Ljava/io/FileDescriptor;

    .line 13
    .line 14
    .line 15
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 16
    :try_start_2
    new-instance v2, Ljava/io/FileOutputStream;

    .line 17
    .line 18
    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 19
    .line 20
    .line 21
    :try_start_3
    invoke-virtual {v2, p0}, Ljava/io/OutputStream;->write([B)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Landroid/os/ParcelFileDescriptor;->dup(Ljava/io/FileDescriptor;)Landroid/os/ParcelFileDescriptor;

    .line 25
    .line 26
    .line 27
    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 28
    :try_start_4
    new-instance v3, Landroid/content/res/loader/ResourcesLoader;

    .line 29
    .line 30
    invoke-direct {v3}, Landroid/content/res/loader/ResourcesLoader;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, v0}, Landroid/content/res/loader/ResourcesProvider;->loadFromTable(Landroid/os/ParcelFileDescriptor;Landroid/content/res/loader/AssetsProvider;)Landroid/content/res/loader/ResourcesProvider;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v3, v4}, Landroid/content/res/loader/ResourcesLoader;->addProvider(Landroid/content/res/loader/ResourcesProvider;)V

    .line 38
    .line 39
    .line 40
    new-instance v4, Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/util/SparseIntArray;->clone()Landroid/util/SparseIntArray;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-direct {v4, v3, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;-><init>(Landroid/content/res/loader/ResourcesLoader;Landroid/util/SparseIntArray;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 47
    .line 48
    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    :try_start_5
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_2

    .line 57
    :cond_1
    :goto_0
    :try_start_6
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 58
    .line 59
    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    :try_start_7
    invoke-static {v1}, Landroid/system/Os;->close(Ljava/io/FileDescriptor;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    .line 63
    .line 64
    .line 65
    return-object v4

    .line 66
    :catch_0
    move-exception p0

    .line 67
    goto :goto_5

    .line 68
    :cond_2
    return-object v4

    .line 69
    :catchall_1
    move-exception p0

    .line 70
    goto :goto_4

    .line 71
    :catchall_2
    move-exception p1

    .line 72
    if-eqz p0, :cond_3

    .line 73
    .line 74
    :try_start_8
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :catchall_3
    move-exception p0

    .line 79
    :try_start_9
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    :goto_1
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 83
    :goto_2
    :try_start_a
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 84
    .line 85
    .line 86
    goto :goto_3

    .line 87
    :catchall_4
    move-exception p1

    .line 88
    :try_start_b
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    :goto_3
    throw p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 92
    :catchall_5
    move-exception p0

    .line 93
    move-object v1, v0

    .line 94
    :goto_4
    if-eqz v1, :cond_4

    .line 95
    .line 96
    :try_start_c
    invoke-static {v1}, Landroid/system/Os;->close(Ljava/io/FileDescriptor;)V

    .line 97
    .line 98
    .line 99
    :cond_4
    throw p0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0

    .line 100
    :goto_5
    const-string p1, "RemoteViews"

    .line 101
    .line 102
    const-string v1, "Failed to setup the context for theme colors"

    .line 103
    .line 104
    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 105
    .line 106
    .line 107
    return-object v0
.end method

.method private static createCompiledResourcesContent(Landroid/content/Context;Landroid/util/SparseIntArray;)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x1100014

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :try_start_0
    invoke-static {v0}, Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;->readFileContent(Ljava/io/InputStream;)Ljava/io/ByteArrayOutputStream;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 17
    .line 18
    .line 19
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 23
    .line 24
    .line 25
    :cond_0
    array-length v0, v1

    .line 26
    add-int/lit16 v0, v0, -0xd14

    .line 27
    .line 28
    if-gez v0, :cond_1

    .line 29
    .line 30
    const-string p0, "RemoteViews"

    .line 31
    .line 32
    const-string p1, "ARSC file for theme colors is invalid."

    .line 33
    .line 34
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return-object p0

    .line 39
    :cond_1
    const v2, 0x106001d

    .line 40
    .line 41
    .line 42
    :goto_0
    const v3, 0x10600d1

    .line 43
    .line 44
    .line 45
    if-gt v2, v3, :cond_3

    .line 46
    .line 47
    const v3, 0xffff

    .line 48
    .line 49
    .line 50
    and-int/2addr v3, v2

    .line 51
    mul-int/lit8 v3, v3, 0x10

    .line 52
    .line 53
    add-int/2addr v3, v0

    .line 54
    invoke-virtual {p0, v2}, Landroid/content/Context;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-virtual {p1, v2, v4}, Landroid/util/SparseIntArray;->get(II)I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    const/4 v5, 0x0

    .line 63
    :goto_1
    const/4 v6, 0x4

    .line 64
    if-ge v5, v6, :cond_2

    .line 65
    .line 66
    add-int v6, v3, v5

    .line 67
    .line 68
    and-int/lit16 v7, v4, 0xff

    .line 69
    .line 70
    int-to-byte v7, v7

    .line 71
    aput-byte v7, v1, v6

    .line 72
    .line 73
    shr-int/lit8 v4, v4, 0x8

    .line 74
    .line 75
    add-int/lit8 v5, v5, 0x1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    return-object v1

    .line 82
    :catchall_0
    move-exception p0

    .line 83
    if-eqz v0, :cond_4

    .line 84
    .line 85
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :catchall_1
    move-exception p1

    .line 90
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    :cond_4
    :goto_2
    throw p0
.end method

.method private static readFileContent(Ljava/io/InputStream;)Ljava/io/ByteArrayOutputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    const/16 v1, 0x800

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const/16 v1, 0x1000

    .line 9
    .line 10
    new-array v1, v1, [B

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-lez v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-object v0
.end method


# virtual methods
.method public apply(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;->mLoader:Landroid/content/res/loader/ResourcesLoader;

    .line 6
    .line 7
    filled-new-array {p0}, [Landroid/content/res/loader/ResourcesLoader;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->addLoaders([Landroid/content/res/loader/ResourcesLoader;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getColorMapping()Landroid/util/SparseIntArray;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;->mColorMapping:Landroid/util/SparseIntArray;

    .line 2
    .line 3
    return-object p0
.end method
